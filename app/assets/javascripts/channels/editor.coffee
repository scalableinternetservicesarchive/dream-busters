App.active_users = App.cable.subscriptions.create { channel: "ActiveUsersChannel", id: gon.editor_id },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data

  speak: (message) ->
    @perform 'speak', message: message, username: gon.username, editor_id: gon.editor_id

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
	if event.keyCode is 13
		App.editor.speak event.target.value
		event.target.value = ''
		event.preventDefault()
