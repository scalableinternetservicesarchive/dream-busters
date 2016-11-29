module EditorsHelper
  def cache_key_for_message(editor, message)
    "message-#{editor.id}-#{message.id}"
  end
end
