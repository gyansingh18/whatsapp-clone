class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.string :name
      t.string :chat_type

      t.timestamps
    end
    add_index :chats, :chat_type
  end
end
