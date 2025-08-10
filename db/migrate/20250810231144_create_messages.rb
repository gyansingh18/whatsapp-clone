class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :chat, null: false, foreign_key: true
      t.timestamp :read_at

      t.timestamps
    end
  end
end
