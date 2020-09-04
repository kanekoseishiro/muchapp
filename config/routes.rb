Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  get 'users', to: 'users#member'
  # resources :users, only: :index
end
