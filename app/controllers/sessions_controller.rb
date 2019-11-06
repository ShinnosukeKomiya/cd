class SessionsController < ApplicationController
before_action :active_user,   only: [:create]


  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

#beforeアクション
  def active_user
    #  byebug
    # user = User.find_by(email: params[:session][:email].downcase)
    if User.find_by(email: params[:session][:email].downcase).deleted#user.deleted
      #log_out
      redirect_to root_url
      flash[:danger] = "This account is deleted"
    end
  end

end
