class EditorsController < ApplicationController
  def show
  	@messages = Message.all
  	@default_content = Editor.default_content
  end
end
