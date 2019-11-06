class CartitemsController < ApplicationController
  before_action :setup_cartitem, only: [:add_item, :update_item, :delete_item]

  def show
    @carts = current_cart.cartitems
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def create
    if @cart.blank?
      @cart = current_cart.cartitems.build(params[:cd_id]
    end

    @cart.quantity += params[:quantity].to_i
    @cart.save
    redirect_to current_cart
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update
    @cart.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

 # カート詳細画面から、「削除」を押した時のアクション
  def delete
    @cart.destroy
    redirect_to current_cart
  end

  private

  def setup_cartitem
    @cart = Cartitem.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:total, :status, :user_id)
  end

end
