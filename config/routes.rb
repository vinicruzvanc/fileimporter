Rails.application.routes.draw do
  resources :purchasers do
    collection do
      post :import
      get 'search', to: 'purchasers#search', as: 'search'
      post 'search', to: 'purchasers#custom_search', as: 'search_index'
    end
  end
  
  root 'pages#home'
  
  resources :authentications, controller: "authentication_users"
  resources :login_users, only: [:new, :create, :destroy]
  
  get 'login', to:'login_users#new', as: 'login'
  get 'logout', to: 'login_users#destroy', as: 'logout'
  
  #get 'welcome', to: 'pages#welcome', as: 'welcome'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
