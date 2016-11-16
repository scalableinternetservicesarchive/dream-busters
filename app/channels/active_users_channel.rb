# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ActiveUsersChannel < ApplicationCable::Channel
	include NoBrainer::Streams

  def subscribed
  	@active_user = ActiveUser.create
  	stream_from ActiveUser.all, include_initial: true
  end

  def unsubscribed
    @active_user.destroy
  end
end
