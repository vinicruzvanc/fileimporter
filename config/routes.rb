Rails.application.routes.draw do
  resources :purchasers do
    collection do
      post :import
    end
  end
  get 'purchasers/purchaser'
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
