Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # as :user do
  #   get 'members/show',:to =>'devise/registrations#edit',:as => :user_root
  # end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "members#index"
  get 'members', to: 'members#top'
  resources :members, only: :show
end
