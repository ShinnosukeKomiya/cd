class LineItemsController < ApplicationController
  before_action :current_cart
  
  def create
    # Find associated cd and current cart
    chosen_cd = Cd.find(params[:cd_id])
    current_cart = @current_cart

    # If cart already has this cd then find the relevant line_item and iterate quantity otherwise create a new line_item for this cd
    if current_cart.cds.include?(chosen_cd)
      # Find the line_item with the chosen_cd
      @line_item = current_cart.line_items.find_by(:cd_id => chosen_cd)
      # Iterate the line_item's quantity by one
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.cd = chosen_cd
    end

    # Save and redirect to cart show path
    @line_item.save
    redirect_to cart_path(current_cart)
  end


  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    end
    @line_item.save
    redirect_to cart_path(@current_cart)
  end


private
  def line_item_params
    params.require(:line_item).permit(:quantity,:cd_id, :cart_id)
  end
end
