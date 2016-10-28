username = ""

App.editor = App.cable.subscriptions.create "EditorChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    $('#myModal').modal('show')

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
	if event.keyCode is 13
		App.editor.speak event.target.value
		event.target.value = ''
		event.preventDefault()

$(document).on 'click', '[data-behavior~=room_speaker_enter]', (event) ->
    App.editor.speak $('#chat').val()
    $('#chat').val('')
    event.preventDefault()

$(document).on 'keypress', '[data-behavior~=room_editor]', (event) ->
  if event.keyCode is 13
    App.editor.speak event.target.value
    event.preventDefault()

$(document).on 'click', '[data-behavior~=room_username]', (event) ->
  username = $('#username').val()
  $('#username').val('')