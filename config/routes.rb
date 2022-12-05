Rails.application.routes.draw do
  resources :users, only: %i[ index show new create destroy ]

  # Defines the root path route ("/")
  root "users#index"
end
