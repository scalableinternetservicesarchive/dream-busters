# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class EditorChannel < ApplicationCable::Channel
  def subscribed
    stream_from "editor_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	Message.create content: data['message'], speaker: data['username'], editor_id: data['editor_id']
  end
end
