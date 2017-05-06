class CreateChatMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_messages do |t|
      t.text :text, null: false
      t.integer :user_id, null: false
      t.integer :chat_room_id, null: false

      t.timestamps
    end
    add_index :chat_messages, :user_id, name: 'user_id'
    add_index :chat_messages, :chat_room_id, name: 'chat_room_id'
    add_index :chat_messages, %i[chat_room_id user_id]
  end
end
