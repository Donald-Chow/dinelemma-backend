Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  get '/users/current_user', to: 'current_user#index'

  resources :votes, only: [:update]
  resources :vote_sessions, only: %i[create update show]

  resources :groups, except: %i[new edit]
  resources :group_members, except: %i[new edit show index]

  resources :restaurants, except: %i[new edit destroy]
  resources :restaurant_lists, except: %i[new edit]
  resources :list_bookmarks, only: %i[create destroy]
end
