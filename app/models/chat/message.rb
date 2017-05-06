# == Schema Information
#
# Table name: chat_messages
#
#  id           :integer          not null, primary key
#  text         :text(65535)      not null
#  user_id      :integer          not null
#  chat_room_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  chat_room_id                                     (chat_room_id)
#  index_chat_messages_on_chat_room_id_and_user_id  (chat_room_id,user_id)
#  user_id                                          (user_id)
#

class Chat::Message < ApplicationRecord
  belongs_to :chat_room, class_name: 'Chat::ChatRoom'
  belongs_to :user, class_name: 'User::Base'
  validates :text, presence: true, length: { minimum: 2, maximum: 1000 }

  after_create_commit { MessageBroadcastJob.perform_later self }
end
