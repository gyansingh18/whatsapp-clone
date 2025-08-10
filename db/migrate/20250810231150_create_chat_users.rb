class CreateChatUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat, null: false, foreign_key: true
      t.string :role, default: 'member'

      t.timestamps
    end
    add_index :chat_users, [:user_id, :chat_id], unique: true
  end
end
