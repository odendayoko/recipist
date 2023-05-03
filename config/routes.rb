Rails.application.routes.draw do
  devise_for :users
  root to: 'menus#index'
  resources :menus do
    collection do
      get 'search'
    end
    resources :favorites, only: [:create, :destroy]
  end 
  resources :users, only: :show do
    member do
      get 'favorite_menus'
      get :follows, :followers
    end
    collection do
      get 'search'
      get 'user_search'
      get 'mypage'
    end
    resource :relationships, only: [:create, :destroy]
  end
end
