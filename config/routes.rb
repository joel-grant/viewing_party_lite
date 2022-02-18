Rails.application.routes.draw do
  root 'welcome#index'
  # get '/welcome/index', to: 'welcome#index'

  get '/login', to: 'users#login_form'
  post '/login', to: 'sessions#create'

  get '/register', to: 'users#new'

  post '/users', to: 'users#create'
  get '/dashboard', to: 'users#show'
  get '/discover', to: 'users#discover'
  get '/movies/:movie_id', to: 'movies#show'
  get '/movies/:movie_id/viewing-party/new', to: 'user_party#new'
  get '/movies', to: 'movies#results'

  post '/movies/:movie_id/viewing-party/create', to: 'user_party#create'
end
