Rails.application.routes.draw do
  devise_for :users
  root to: 'menus#index'
  resources :menus do
    collection do
      get 'search'
    end
  end 
  resources :users, only: :show

end
