Rails.application.routes.draw do
  root 'welcome#index'
  get '/welcome/index', to: 'welcome#index'

  resources :user, only: [:create, :show] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
