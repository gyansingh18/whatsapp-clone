class MessagesController < ApplicationController
  before_action :require_user

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.user = current_user

    if @message.save
      head :ok
    else
      render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
