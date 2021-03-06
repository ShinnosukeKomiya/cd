class UsersController < ApplicationController
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:show, :edit, :update]


  def show
    @user = User.find(params[:id])
    @ranks = Ranking.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.deleted = true
    user.save
    log_out if logged_in?
    flash[:success] = "User deleted"
    redirect_to root_url
  end

  def card
    @card = Card.new
  end

  #お気に入り投稿一覧取得
  def likes
    @user = User.find(params[:id])
    @favs = @user.favcds
  end

 private

   def user_params
     params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
   end

   # beforeアクション

    # ログイン済みユーザーかつアクティブユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
      #if User.active.find_by(params[:id]).nil?
      #  redirect_to root_url
      #  flash[:danger] = "This account is deleted"
      #end
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
