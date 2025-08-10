class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates :content, presence: true, length: { maximum: 1000 }

  scope :recent, -> { order(created_at: :desc) }
  scope :unread_for_user, ->(user) { where('created_at > ?', user.chat_users.find_by(chat: chat)&.updated_at || Time.current) }

  after_create_commit :broadcast_message

  private

  def broadcast_message
    ActionCable.server.broadcast(
      "chat_#{chat_id}",
      {
        id: id,
        content: content,
        user: {
          id: user.id,
          username: user.username
        },
        created_at: created_at.strftime('%H:%M'),
        chat_id: chat_id
      }
    )
  end
end
