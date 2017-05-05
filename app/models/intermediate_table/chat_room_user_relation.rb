# == Schema Information
#
# Table name: intermediate_table_chat_room_user_relations
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  chat_room_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  chat_room_id           (chat_room_id)
#  chat_room_user_unique  (user_id,chat_room_id) UNIQUE
#  user_id                (user_id)
#

class IntermediateTable::ChatRoomUserRelation < ApplicationRecord
  belongs_to :user, class_name: "User::Base"
  belongs_to :chat_room, class_name: "Chat::ChatRoom"
end
