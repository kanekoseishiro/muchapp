Rails.application.routes.draw do
  devise_scope :user do
    get '/members/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  root "members#index"
  get 'members', to: 'members#top'
  # resources :users, only: :index
end
