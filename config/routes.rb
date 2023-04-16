Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'userinfos', to: 'users/registrations#new_userinfo'
    post 'userinfos', to: 'users/registrations#create_userinfo'
    get 'userinfos/search', to: 'users/registrations#search'
  end    
  
  
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :users, only: :show do
    resource :relationships, only: [:create, :destroy]
  end
end
