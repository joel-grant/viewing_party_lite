Rails.application.routes.draw do
  root 'welcome#index'
  get '/welcome/index', to: 'welcome#index'

  get '/register', to: 'users#new'

  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/discover', to: 'movies#index'
  get '/users/:id/movies/:id', to: 'movies#show'
  # resource :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
