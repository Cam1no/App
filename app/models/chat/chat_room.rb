# == Schema Information
#
# Table name: chat_chat_rooms
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_chat_chat_rooms_on_name  (name)
#

class Chat::ChatRoom < ApplicationRecord
  has_many :chat_room_relations, foreign_key: "chat_room_id", class_name: "IntermediateTable::ChatRoomUserRelation", dependent: :destroy
  has_many :users, through: :chat_room_relations

  has_many :messages, foreign_key: "chat_room_id", class_name: "Chat::Message", dependent: :destroy
end
