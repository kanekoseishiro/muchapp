class UsersController < ApplicationController
  before_action :move_to_users, only: [:index]

  def index
  end

  def member
  end

  private

  def move_to_users
    unless user_signed_in?
      redirect_to users_path
    end
  end
end
