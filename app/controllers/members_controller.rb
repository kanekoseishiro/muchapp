class MembersController < ApplicationController
  before_action :move_to_members, only: [:index]

  def index
    # @user = user.all
  end

  def top
  end

  private

  def move_to_members
    unless user_signed_in?
      redirect_to mambers_path
    end
  end
end
