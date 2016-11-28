App.editor_lines = App.cable.subscriptions.create { channel: "EditorLinesChannel", id: gon.editor_id },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    App.page.update_line(data.new_val)

  set_line_value: (line_num, value) ->
    @perform('set_line_value', editor_id: gon.editor_id, line_num: line_num, value: value)
    