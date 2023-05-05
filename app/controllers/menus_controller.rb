class MenusController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :search]
  
  def index
    @menus = current_user.menus.order("created_at DESC")
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
      if @menu.save
        redirect_to root_path
      else
        render :new
      end
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to root_path
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    menu = Menu.find(params[:id])
    menu.update(menu_params)
    redirect_to root_path
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def search
    @menus = Menu.all
    if params[:word].present?
      @menus = Menu.where('name LIKE ?', "%#{params[:word]}%")
    end
  end

  def favorite
    @menu = Menu.find(params[:id])
    Favorite.create(user_id: current_user.id, menu_id: @menu.id)
    render :show
  end


  def following_menus
    following_user_id = current_user.following_users.pluck(:id)
    @menus = Menu.where(user_id: following_user_id)
  end  

  private
  def menu_params
    params.require(:menu).permit(:name, :url, :memo, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
