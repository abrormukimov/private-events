Rails.application.routes.draw do
  resources :users, only: %i[index create show]
  get 'signup', to: 'users#new'
  root 'users#index'
end
