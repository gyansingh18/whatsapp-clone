class ChatUser < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates :role, presence: true, inclusion: { in: %w[admin member] }
  validates :user_id, uniqueness: { scope: :chat_id }
end
