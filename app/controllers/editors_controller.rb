class EditorsController < ApplicationController
  def index 
  end

  def new 
  	@editor = Editor.new
  	@messages = Message.all
  	@default_content = Editor.default_content
  end

  def create

  end 


end
