Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :welcomes
  resources :teams, only: (:index)
  resources :contacts, only: (:index)
  resources :users
  resources :gossips
  resources :cities

end
