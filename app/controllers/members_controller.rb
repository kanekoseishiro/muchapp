class MembersController < ApplicationController
  before_action :move_to_members, only: [:index]

  def index
    @members = User.where.not(id: current_user.id).order("created_at DESC")
    @member = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def top
  end

  private

  def move_to_members
    unless user_signed_in?
      redirect_to members_path
    end
  end
end
