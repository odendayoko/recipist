class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @menus = current_user.menus
  end

  def favorite_menus
    @menus = current_user.favorite_menus
  end
end
