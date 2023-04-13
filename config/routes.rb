Rails.application.routes.draw do
  devise_for :users
  root to: 'menus#index'
  resources :menus do
    collection do
      get 'search'
    end
    # resources :favorite, only: [:create, :destroy]
  end 
  resources :users, only: :show
  post 'menus/:id/favorite', to: 'menus#favorite'
end
