class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @menus = @user.menus
  end

  
  def mypage
    @nickname = current_user.nickname
    @menus = current_user.menus
  end

  def favorite_menus
    @menus = current_user.favorite_menus
  end

  def user_search
  end
  
  def search
    if params[:keyword].present?
      @users = User.where('nickname LIKE ?', "%#{params[:keyword]}%")
    else
      @users = nil
    end
  end
end
