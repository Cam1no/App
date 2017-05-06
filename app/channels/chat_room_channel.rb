class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    user = ::User::Base.find(data['user_id'])
    user.chat_messages.create!(text: data['text'], chat_room_id: data['chat_room_id'])
  end
end
