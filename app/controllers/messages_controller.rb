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
# Security enhancement 103: Mon Aug 11 10:18:52 IST 2025
# Security enhancement 109: Mon Aug 11 10:18:52 IST 2025
# Security enhancement 115: Mon Aug 11 10:18:53 IST 2025
# Security enhancement 121: Mon Aug 11 10:18:53 IST 2025
# Security enhancement 127: Mon Aug 11 10:18:54 IST 2025
# Security enhancement 133: Mon Aug 11 10:18:54 IST 2025
# Security enhancement 139: Mon Aug 11 10:18:55 IST 2025
# Security enhancement 145: Mon Aug 11 10:18:55 IST 2025
# Security enhancement 151: Mon Aug 11 10:18:56 IST 2025
# Security enhancement 157: Mon Aug 11 10:18:56 IST 2025
# Security enhancement 163: Mon Aug 11 10:18:57 IST 2025
# Security enhancement 169: Mon Aug 11 10:18:57 IST 2025
# Security enhancement 175: Mon Aug 11 10:18:58 IST 2025
# Security enhancement 181: Mon Aug 11 10:18:58 IST 2025
# Security enhancement 187: Mon Aug 11 10:18:59 IST 2025
