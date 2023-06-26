Rails.application.routes.draw do
  resources :listings, only: %I[index show create update destroy]
  resources :listings, only: %I[index]
end
