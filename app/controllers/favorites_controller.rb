class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    if user_signed_in?
      favorite = current_user.favorites.build(menu_id: params[:menu_id])
      favorite.save
      redirect_to request.referer
    end
  end

  def destroy
    favorite = Favorite.find_by(menu_id: params[:menu_id], user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer
  end
end
