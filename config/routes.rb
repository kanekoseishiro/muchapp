Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  root "users#index"
  get 'users', to: 'users#member'
  # resources :users, only: :index
end
