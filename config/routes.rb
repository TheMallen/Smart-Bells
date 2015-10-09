# routes.rb
# By: Mathew Allen
# Sets up routes for the application

Rails.application.routes.draw do
  # Set up named routes

  # root route
  root 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'signup' => 'users#new'

  # login/out routes
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # set up resourceful routes
  resources :users do
  end

  # routes for creating a new workout
  resources :workout_sessions do
    collection do
      get 'choose_routine', to: 'workout_sessions#choose_routine', as: 'choose_routine'
      get 'new_for_routine/:routine', to: 'workout_sessions#new_for_routine', as: 'new_for_routine'
    end
  end

  # routes for creating a new routine
  resources :routines do
  end

  # routes for defining new exercise
  get 'exercises', to: 'exercises#new', as: 'new_exercise'
  post 'exercises', to: 'exercises#create', as: 'exercises'

  ###
  API
  ###

  add_relationship_links = proc do
    collection do
      get :index
      put :update
    end
    member do
      post :create
      get :show
      delete :destroy
    end
  end

  # api
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy] do
        namespace :links do
          resources :workout_sessions, only: [] do
            add_relationship_links.call
          end
          resources :routines, only: [] do
            add_relationship_links.call
          end
          resources :personal_records, only: [:index, :show] do
            add_relationship_links.call
          end
          resources :achievements, only: [:index, :show] do
            add_relationship_links.call
          end
        end
      end
      resources :workout_sessions, only: [:index, :create, :show, :update, :destroy] do
        namespace :links do
          resources :workout_set_groups, only: [] do
            add_relationship_links.call
          end
        end
      end
      resources :routines, only: [:index, :create, :show, :update, :destroy]  do
        namespace :links do
          resources :set_groups, only: [] do
            add_relationship_links.call
          end
        end
      end
      resources :exercises, only: [:index, :create, :show, :update, :destroy]
      resources :sessions, only: [:create]
      resources :personal_records, only: [:index, :show]
      resources :achievements, only: [:index, :show]
    end
  end
end
