# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ActiveUsersChannel < ApplicationCable::Channel
	include NoBrainer::Streams

  def subscribed
  	@active_user = ActiveUser.create editor_id: params[:id], name: params[:name]
  	stream_from ActiveUser.where(editor_id: params[:id])
  end

  def unsubscribed
    @active_user.destroy
  end
end
