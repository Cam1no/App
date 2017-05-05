class CreateChatChatRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_chat_rooms do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :chat_chat_rooms, :name
  end
end
