class MenusController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :move_to_index, except: [:index, :show, :search]
  
  def index
    @page = "menus"
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
    @page = "followings"
    if user_signed_in?
     following_user_id = current_user.following_users.pluck(:id)
    end
    @menus = Menu.where(user_id: following_user_id).order("created_at DESC")
  end  

  private
  def menu_params
    if params.require(:menu).permit(:image)[:image]
      image_size =  ImageProcessing::MiniMagick.source(params.require(:menu).permit(:image)[:image].tempfile).call.size
      # 画像が500kB以上ならリサイズする
      if image_size > 500000
        resized_image = ImageProcessing::MiniMagick.source(params.require(:menu).permit(:image)[:image].tempfile).resize_to_fit(500,500).call
        new_params = params
        new_params.require(:menu).permit(:image)[:image].tempfile = resized_image
        new_params.require(:menu).permit(:name, :url, :memo, :image).merge(user_id: current_user.id)
      else
        params.require(:menu).permit(:name, :url, :memo, :image).merge(user_id: current_user.id)
      end
    else
      params.require(:menu).permit(:name, :url, :memo, :image).merge(user_id: current_user.id)
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
