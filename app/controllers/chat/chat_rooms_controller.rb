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
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  private

  def chat_room_params
    params.require(:chat_chat_room).permit(:name)
  end

end
