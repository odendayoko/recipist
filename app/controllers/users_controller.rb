class UsersController < ApplicationController
  before_action :authenticate_user!
    
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @menus = @user.menus
  end

  
  def mypage
    @nickname = current_user.nickname
    @menus = current_user.menus
    @user = User.find(params[:id])
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end

  def favorite_menus
    @page = "likes"
    @menus = current_user.favorite_menus.order("created_at DESC")
  end

  def user_search
  end
  
  def search
    if params[:keyword].present?
      @users = User.where('nickname LIKE ?', "%#{params[:keyword]}%")
      @users = nil if @users.empty?
    else
      @users = []
    end
  end
end
