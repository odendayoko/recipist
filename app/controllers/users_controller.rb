class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @menus = current_user.menus
  end
end
