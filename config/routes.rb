Rails.application.routes.draw do
  resources :purchasers do
    collection do
      post :import
      get 'search', to: 'purchasers#search', as: 'search'
    end
  end

  root 'pages#home'

  resources :authentications, controller: "authentication_users"
  resources :login_users, only: [:new, :create, :destroy]

  get 'login', to:'login_users#new', as: 'login'
  get 'logout', to: 'login_users#destroy', as: 'logout'

end
