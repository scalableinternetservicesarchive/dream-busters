class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message, id)
    ActionCable.server.broadcast 'editor_channel_'+id, render_message(message)
  end

  private
  	def render_message(message)
  		ApplicationController.renderer.render message
  	end
end
