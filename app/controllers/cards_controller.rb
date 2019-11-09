class CardsController < ApplicationController
  #before_action :correct_user
  #before_action :logged_in_user

  def new
    @card = Card.new
  end

  def create
    card = Card.new(card_params)
    card.user_id = session[:user_id]
    if card.save
      redirect_to new_order_path
    else
      render 'new'
    end
  end

  private

  def card_params
    params.require(:card).permit(:cardnumber, :duedate, :security)
  end
end
