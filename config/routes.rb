# routes.rb
# By: Mathew Allen
# Sets up routes for the application

Rails.application.routes.draw do
  # Routes exceedingly similar to reference 1...
  # But what else would I call them?

  # Set up named routes
  root 'static_pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # Set up resourceful routes
  resources :users
end
