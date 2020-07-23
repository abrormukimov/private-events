Rails.application.routes.draw do
  resources :users, only: [:index, :create, :show]
  get 'signup', to: 'users#new'
  resources :events

  resources :sessions, only: [:new, :create, :destroy]

  root to: 'events#index'
end
