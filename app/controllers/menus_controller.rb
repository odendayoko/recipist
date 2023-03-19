class MenusController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    Menu.create(menu_params)
    redirect_to root_path
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

  private
  def menu_params
    params.require(:menu).permit(:name, :url, :memo, :image)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
