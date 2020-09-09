Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "members#index"
  get 'members', to: 'members#top'
  resources :members, only: :show
  resources :members, only: :show do
    member do
      get :following, :follower, :mach
    end
  end
  resources :follow_relationships, only: [:create, :destroy]
  resources :messages, only: [:index, :create]
end
