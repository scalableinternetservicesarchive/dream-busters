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

    @editor = Editor.new(params[:params])
    @editor.filename = "default"
    @editor.hashpath = next_id.to_s

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

  def edit
    @editor_id = params[:id]
    gon.editor_id = @editor_id
    @id = params[:id]
    @messages = Message.where(editor_id: @id)
    @default_content = ""
  end

end
