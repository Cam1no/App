class CreateIntermediateTableChatRoomUserRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :intermediate_table_chat_room_user_relations do |t|
      t.integer :user_id, null: false
      t.integer :chat_room_id, null: false

      t.timestamps
    end
    add_index :intermediate_table_chat_room_user_relations, :user_id, name: "user_id"
    add_index :intermediate_table_chat_room_user_relations, :chat_room_id, name: "chat_room_id"
    add_index :intermediate_table_chat_room_user_relations, [:user_id, :chat_room_id], unique: true, name: "chat_room_user_unique"
  end
end
