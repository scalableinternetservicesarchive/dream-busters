# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ActiveUsersChannel < ApplicationCable::Channel
	include NoBrainer::Streams

  def subscribed
  	@active_user = ActiveUser.create editor_id: params[:id], name: params[:name]
  	transmit current_user: @active_user
  	stream_from ActiveUser.where(editor_id: params[:id]), include_initial: true
  end

  def unsubscribed
    @active_user.destroy
  end

  def select_line(message)
  	@active_user.update! selected_line: message['selected_line']
  end

end
