class Chat::ChatRoomsController < ApplicationController

  def index
    @chat_rooms = ::Chat::ChatRoom.all
  end

  def show
    @chat_room = ::Chat::ChatRoom.includes(:chat_messages).find_by(id: params[:id])
  end

  def new
    @chat_room = ::Chat::ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save!
      current_user.chat_room_relations.create!(chat_room_id: @chat_room.id)
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def join
    chat_room_id = params[:chat_room_id]
    current_user.chat_room_relations.create!(chat_room_id: chat_room_id)
    flash[:notice] = "ChatRoomに参加しました"
    redirect_to chat_room_path(chat_room_id)
  end

  private

  def chat_room_params
    params.require(:chat_chat_room).permit(:name)
  end

end
