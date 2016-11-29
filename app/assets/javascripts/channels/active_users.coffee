App.active_users = App.cable.subscriptions.create { channel: "ActiveUsersChannel", id: gon.editor_id, name: gon.username},
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data.old_val && !data.new_val
      App.page.remove_user(data.old_val)
    else if data.new_val
      App.page.new_user(data.new_val)
    else if data.current_user
      App.page.set_current_user(data.current_user)

  select_line: (line) ->
    @perform('select_line', selected_line: line)
