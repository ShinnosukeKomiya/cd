class OrdersController < ApplicationController
  before_action :current_cart

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @cart = @current_cart
  end

  def create
     #begin
       ActiveRecord::Base.transaction do
         #そのユーザの買う量を変更できないように
         @cart = @current_cart
         @cart_items = LineItem.where(cart_id: @cart.id)
         @cart_items.each do |item|
           @stock = Stock.lock.find_by(cd_id: item.cd_id)
           @stock.num -= item.quantity
           @stock.save!
           @order = Order.new(user_id: @cart.user_id, cd_id: item.cd_id, total: item.quantity)
           @stock.save!
           @order.save!
         end
         stocks = Stock.where(cd_id: @cart_items)
         @cart.destroy!
       end
       flash[:success] = "購入ありがとうございました"
       redirect_to root_path
     #rescue => e
#       p "ロールバック"
#       flash[:notice] = "商品の在庫に変更がありました。ご確認ください"
#       redirect_to cart_path(current_user)
     #end
   end

private
  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_method)
  end
end
