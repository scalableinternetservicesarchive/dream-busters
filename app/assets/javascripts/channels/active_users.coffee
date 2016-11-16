App.active_users = App.cable.subscriptions.create "ActiveUsersChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data.old_val && !data.new_val
      App.page.remove_user(data.old_val)
    else if data.new_val
      App.page.new_user(data.new_val)