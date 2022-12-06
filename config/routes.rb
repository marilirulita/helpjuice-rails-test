Rails.application.routes.draw do
  resources :searches, only: %i[ index show new create destroy ]
  resources :users, only: %i[ index show new create destroy ]

  # Defines the root path route ("/")
  root "users#index"
end
