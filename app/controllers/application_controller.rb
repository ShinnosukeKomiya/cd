class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :current_cart

  def current_cart
    if session[:order_id]
      @cart = Cartitem.find(session[:order_id])
    else
      @cart = Cartitem.create
      session[:order_id] = @cart.id
    end
  end
end
