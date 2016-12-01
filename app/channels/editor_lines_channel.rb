# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class EditorLinesChannel < ApplicationCable::Channel
  include NoBrainer::Streams

  def subscribed
    stream_from EditorLine.where(editor_id: params[:id]), include_initial: true
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def set_line_value(message)
    if line = EditorLine.where(editor_id: message['editor_id'], line_num: message['line_num']).first
      line.update! value: message['value'] 
    else
      line = EditorLine.create(editor_id: message['editor_id'], line_num: message['line_num'], value: message['value'])
    end
  end
end
