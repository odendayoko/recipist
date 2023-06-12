Rails.application.routes.draw do
  devise_for :users
  root to: 'menus#index'
  resources :menus do
    collection do
      get 'search'
      get 'following_menus'
    end
    resource :favorites, only: [:create, :destroy]
  end 
  resources :users, only: :show do
    member do
      get 'favorite_menus'
      get :follows, :followers
      get 'mypage'
    end
    collection do
      get 'search'
      get 'user_search'  
    end
    resource :relationships, only: [:create, :destroy]
  end
  resources :welcome, only: [:index]
end
