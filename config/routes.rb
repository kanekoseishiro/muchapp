Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  # resourses: users, only:[:index]
end
