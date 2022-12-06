Rails.application.routes.draw do
  resources :users, only: %i[ index new create destroy ] do
    resources :searches, only: %i[ index show new create destroy ]
  end

  # Defines the root path route ("/")
  root "users#index"
end
