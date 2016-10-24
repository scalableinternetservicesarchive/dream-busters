App.editor = App.cable.subscriptions.create "EditorChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
	if event.keyCode is 13
		App.room.speak event.target.value
		event.target.value = ''
		event.preventDefault()

$(document).on 'click', '[data-behavior~=room_speaker_enter]', (event) ->
    App.room.speak $('#chat').val()
    $('#chat').val('')
    event.preventDefault()

$(document).on 'keypress', '[data-behavior~=room_editor]', (event) ->
  if event.keyCode is 13
    App.room.speak event.target.value
    event.preventDefault()