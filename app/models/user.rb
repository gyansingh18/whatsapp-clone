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
# Model enhancement 9: Mon Aug 11 10:16:59 IST 2025
# Model enhancement 14: Mon Aug 11 10:16:59 IST 2025
# Model enhancement 19: Mon Aug 11 10:17:00 IST 2025
# Model enhancement 24: Mon Aug 11 10:17:01 IST 2025
# Model enhancement 29: Mon Aug 11 10:17:01 IST 2025
# Model enhancement 34: Mon Aug 11 10:17:02 IST 2025
# Model enhancement 39: Mon Aug 11 10:17:03 IST 2025
# Model enhancement 44: Mon Aug 11 10:17:04 IST 2025
# Model enhancement 49: Mon Aug 11 10:17:04 IST 2025
# Model enhancement 54: Mon Aug 11 10:17:05 IST 2025
# Model enhancement 59: Mon Aug 11 10:17:06 IST 2025
# Model enhancement 64: Mon Aug 11 10:17:06 IST 2025
# Model enhancement 69: Mon Aug 11 10:17:07 IST 2025
# Model enhancement 74: Mon Aug 11 10:17:08 IST 2025
# Model enhancement 79: Mon Aug 11 10:17:08 IST 2025
