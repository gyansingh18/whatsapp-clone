class User < ApplicationRecord
  has_secure_password

  has_many :chat_users, dependent: :destroy
  has_many :chats, through: :chat_users
  has_many :messages, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :online, -> { where(online: true) }
  scope :offline, -> { where(online: false) }

  def online!
    update(online: true)
  end

  def offline!
    update(online: false)
  end
end
# Model enhancement 4: Mon Aug 11 10:16:58 IST 2025
