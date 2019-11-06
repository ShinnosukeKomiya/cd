class FavsController < ApplicationController
  def create
    #@cdとはならない
    cd = Cd.find(params[:cd_id])
    current_user.like(cd)
    created(fav)
    flash[:success] = 'お気に入り登録をしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    cd = Cd.find(params[:cd_id])
    current_user.unlike(cd)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
