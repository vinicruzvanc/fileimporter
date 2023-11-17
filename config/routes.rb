Rails.application.routes.draw do
  resources :purchasers do
    collection do
      post :import
    end
  end
  
  root 'pages#home'

  resources :authentications, controller: "authentication_users"

  resources :login_users, only: [:new, :create, :destroy]

  get 'login', to:'login_users#new', as: 'login'
  get 'logout', to: 'login_users#destroy', as: 'logout'

  #get '/login', to: 'login_users#new'
  #delete '/logout', to: 'login_users#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
