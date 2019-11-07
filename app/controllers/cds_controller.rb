class CdsController < ApplicationController
  def index
    @cds = Cd.all.reverse_order.paginate(page: params[:page])
  end

  def show
    @cd = Cd.find(params[:id])
    #binding.pry
  end

  def edit
      begin
        @cd = Cd.find(params[:id])
      rescue
        redirect_to action: 'index'
      end
      #@cd = cd.find_by(params[:id])
  end

  def new
    @cd = Cd.new
  end

  def create
    @cd = Cd.new(cd_params)
    if @cd.save
      flash[:success] = "your cd inserted!"
      redirect_to cds_path
    else
      render 'new'
    end
  end

  def update
    @cd = Cd.find(params[:id])
    if @cd.update_attributes(cd_params)
      flash[:success] = "cd updated"
      redirect_to cds_path
    else
      render 'show'
    end
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @cds = Cd.search(params[:search])
  end

  def destroy
    Cd.find(params[:id]).destroy
    flash[:success] = "cd deleted"
    redirect_to action: 'index'
  end

  private

    def cd_params
      params.require(:cd).permit(:title, :artist, :price, :icon, :genre_id, :stock_id)
    end

    def set_cd
      @cd = Cd.find(params[:id])
    end

    # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = Cd.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
