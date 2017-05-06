App.chat_room = App.cable.subscriptions.create "ChatRoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('textarea#chat_message_text').val("")
    $('#messages').append data['message']
