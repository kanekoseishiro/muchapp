Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :members, only: :index
  # resources :users, only:[:index]
end
