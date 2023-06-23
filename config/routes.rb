Rails.application.routes.draw do
  get 'missions/index'
  get 'listing/index'
  get 'listing/show'
  get 'listing/create'
  get 'listing/update'
  get 'listing/delete'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  ressources: listing only(index)

end
