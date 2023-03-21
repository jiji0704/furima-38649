Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'userinfos', to: 'users/registrations#new_userinfo'
    post 'userinfos', to: 'users/registrations#create_userinfo'
  end
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
