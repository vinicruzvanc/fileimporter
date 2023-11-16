Rails.application.routes.draw do
  resources :purchasers do
    collection do
      post :import
    end
  end
  
  root 'pages#home'

  resources :authentications, controller: "authentication_users"

  resources :login_users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
