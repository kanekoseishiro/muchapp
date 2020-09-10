class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.includes(:user)
  end

  def create
    @message = Message.new(message_params)
    @message.save
    if @message.save
      redirect_to messages_path
    else
      @messages = Message.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
