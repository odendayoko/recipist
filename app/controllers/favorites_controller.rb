class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu
  
  def create
    if user_signed_in?
      favorite = current_user.favorites.build(menu_id: params[:menu_id])
      favorite.save
      render 'create.js.erb'
    end
  end

  def destroy
    favorite = Favorite.find_by(menu_id: params[:menu_id], user_id: current_user.id)
    favorite.destroy
    render 'destroy.js.erb'
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end
end
