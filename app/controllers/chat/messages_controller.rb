class Chat::MessagesController < ApplicationController

  def create
    message = current_user.chat_messages.create(chat_room_id: params[:chat_message][:chat_room_id], text: params[:chat_message][:text])
    head :ok
  end
end
