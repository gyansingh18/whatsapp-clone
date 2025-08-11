class Chat < ApplicationRecord
  has_many :chat_users, dependent: :destroy
  has_many :users, through: :chat_users
  has_many :messages, dependent: :destroy

  validates :chat_type, presence: true, inclusion: { in: %w[direct group] }
  validates :name, presence: true, if: -> { chat_type == 'group' }

  scope :direct_chats, -> { where(chat_type: 'direct') }
  scope :group_chats, -> { where(chat_type: 'group') }

  def self.find_or_create_direct_chat(user1, user2)
    # Find existing direct chat between two users
    chat = joins(:chat_users)
           .where(chat_type: 'direct')
           .group(:id)
           .having('COUNT(chat_users.user_id) = 2')
           .where(chat_users: { user_id: [user1.id, user2.id] })
           .first

    unless chat
      chat = create!(
        name: "#{user1.username} & #{user2.username}",
        chat_type: 'direct'
      )
      chat.chat_users.create!([
        { user: user1, role: 'member' },
        { user: user2, role: 'member' }
      ])
    end

    chat
  end

  def last_message
    messages.order(created_at: :desc).first
  end

  def unread_count_for(user)
    messages.where('created_at > ?', user.chat_users.find_by(chat: self)&.updated_at || Time.current).count
  end
end
# Model optimization 105: Mon Aug 11 10:18:52 IST 2025
# Model optimization 111: Mon Aug 11 10:18:52 IST 2025
