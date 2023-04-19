class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(menu_id: params[:menu_id])
    favorite.save
    redirect_to root_path
  end

  def destroy
    favorite = Favorite.find_by(menu_id: params[:menu_id], user_id: current_user.id)
    favorite.destroy
    redirect_to root_path
  end
end
