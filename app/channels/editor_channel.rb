# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class EditorChannel < ApplicationCable::Channel
  def subscribed
    stream_from "editor_channel_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	message = Message.create content: data['message'], speaker: data['username'], editor_id: data['editor_id']
  	MessageBroadcastJob.perform_later message, "#{params[:id]}"
  end

  def edit(data)
  	content = data['content']
  	username = data['username']
  	editor_id = data['editor_id']
  	
  	system("git -C /tmp/#{editor_id} checkout -b ".concat(username))

  	File.open("/tmp/#{editor_id}/file.txt", 'w') do |f2|  
  		f2.puts content
	end

	system("git -C /tmp/#{editor_id} add /tmp/#{editor_id}/*")

	# git commit
	system("git -C /tmp/#{editor_id} commit -m \"".concat(username).concat("\""))

	# git checkout master
	system("git -C /tmp/#{editor_id} checkout master")

	system("git -C /tmp/#{editor_id} merge ".concat(username))

	file = File.open("/tmp/#{editor_id}", "rb")
	new_content = file.read+"aaa"

  end
end
