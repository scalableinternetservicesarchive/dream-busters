class EditorsController < ApplicationController
  def index 
  end

  def new 
  	@editor = Editor.new
  end

  def create
  	if Editor.maximum(:id).nil?
  		next_id = 0
  	else
  		next_id = Editor.maximum(:id)+1;
 	  end

   	permitted = params.require(:editor).permit(:user1)
   	permitted[:path] = next_id.to_s
   	@editor = Editor.new(permitted)

   	if @editor.save
<<<<<<< HEAD
      # Dir.mkdir '/tmp/'.concat(@editor.id)
=======
      # Dir.mkdir '/tmp/'.concat(@editor.id)
>>>>>>> 181cda51352652491f4ccce5b2a4fcf8862a1cfd
   		redirect_to edit_editor_path(@editor.id)
   	else 
   		render 'new'
   	end
  end 

  def edit
  	@editor_id = params[:id]
    gon.editor_id = @editor_id
    @id = params[:id]
  	@messages = Message.find_by(editor_id: @id)
  	@default_content = "hello world"
  end

end 
