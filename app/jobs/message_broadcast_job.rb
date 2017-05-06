class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'messages', message: render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'chat/messages/message', locals: { message: message })
  end
end
