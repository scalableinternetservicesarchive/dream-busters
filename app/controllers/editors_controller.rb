class EditorsController < ApplicationController

  def new
    @editor = Editor.new(params[:editor])
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
      Dir.mkdir "/tmp/#{@editor.id}"
      system("git -C /tmp/#{@editor.id} init")
      system("touch /tmp/#{@editor.id}/file.txt")
      system("git -C /tmp/#{@editor.id} add /tmp/#{@editor.id}/*")
      system("git -C /tmp/#{@editor.id} commit -m \"init repo\"")
      redirect_to edit_editor_path(@editor.id)
    else
      render 'new'
    end
  end

  def show
  	@messages = Message.all
  	@default_content = Editor.default_content
  end
end
