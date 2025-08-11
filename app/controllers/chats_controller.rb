class ChatsController < ApplicationController
  before_action :require_user
  before_action :set_chat, only: [:show]

  def index
    @chats = current_user.chats.includes(:users, :messages)
                         .left_joins(:messages)
                         .group('chats.id')
                         .order(Arel.sql('MAX(messages.created_at) DESC NULLS LAST'))
    @users = User.where.not(id: current_user.id).online
  end

  def show
    @messages = @chat.messages.includes(:user).order(:created_at)
    @message = Message.new
    @other_users = @chat.users.where.not(id: current_user.id)
  end

  def new
    @chat = Chat.new
    @users = User.where.not(id: current_user.id)
  end

  def create
    if params[:user_id].present?
      # Creating direct chat
      other_user = User.find(params[:user_id])
      @chat = Chat.find_or_create_direct_chat(current_user, other_user)
      redirect_to @chat
    else
      # Creating group chat
      @chat = Chat.new(chat_params)
      @chat.chat_type = 'group'

      if @chat.save
        @chat.chat_users.create!(user: current_user, role: 'admin')

        if params[:user_ids].present?
          params[:user_ids].each do |user_id|
            @chat.chat_users.create!(user_id: user_id, role: 'member')
          end
        end

        redirect_to @chat
      else
        @users = User.where.not(id: current_user.id)
        render 'new'
      end
    end
  end

  private

  def set_chat
    @chat = current_user.chats.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:name)
  end
end
# Performance improvement 108: Mon Aug 11 10:18:52 IST 2025
# Performance improvement 114: Mon Aug 11 10:18:53 IST 2025
# Performance improvement 120: Mon Aug 11 10:18:53 IST 2025
# Performance improvement 126: Mon Aug 11 10:18:54 IST 2025
# Performance improvement 132: Mon Aug 11 10:18:54 IST 2025
# Performance improvement 138: Mon Aug 11 10:18:55 IST 2025
