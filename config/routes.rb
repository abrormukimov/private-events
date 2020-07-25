Rails.application.routes.draw do
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :events

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'events#index'
end
