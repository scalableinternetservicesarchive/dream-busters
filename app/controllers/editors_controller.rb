class EditorsController < ApplicationController

  def load
    if current_user     # if user exists
      @user = current_user
      @editor = Editor.where(hashpath: params[:hashpath]).take
      @editor_id = @editor.id
      @editors = @user.editors.all
      if Editor.where(id: @editor_id).exists?   # if such a document exists, load it
        if UserEditorRelationship.where(user_id:@user.id, editor_id: @editor_id).exists?
          # if the file is in the relationship table, pass
        else
          UserEditorRelationship.create user_id: @user.id, editor_id: @editor_id
          system("git -C /tmp/#{@editor_id} checkout -b" + @user.email)
        end
        redirect_to editor_path(@editor)
      else    # else render user's profile page
        flash[:error] = "This file doesn't exist"
        render 'welcomes/show'
      end

    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  def new
    @editor = Editor.new
  end

  def create
    @editor = Editor.new
    @editor.filename = params[:editor][:filename]

    require 'securerandom'
    SecureRandom.urlsafe_base64(6)
    @editor.hashpath = SecureRandom.urlsafe_base64(4)

    if @editor.save

      if current_user
        @user = current_user
        UserEditorRelationship.create user_id: @user.id, editor_id: @editor.id
      else
        redirect_to new_user_session_path, notice: 'You are not logged in.'
      end

      Dir.mkdir "/tmp/#{@editor.id}"
      system("git -C /tmp/#{@editor.id} init")
      system("touch /tmp/#{@editor.id}/file.txt")
      system("git -C /tmp/#{@editor.id} add /tmp/#{@editor.id}/*")
      system("git -C /tmp/#{@editor.id} commit -m \"init repo\"")
      system("git -C /tmp/#{@editor.id} checkout -b" + @user.email)
      redirect_to editor_path(@editor)
    else
      render 'new'
    end
  end

  def show
    @editor = Editor.where(hashpath: params[:id]).first

    @editor_id = @editor.id
    gon.editor_id = @editor_id

    @username = current_user.username.username
    gon.username = @username

    @messages = Message.where(editor_id: @editor_id)
  end

  def update
    @editor = Editor.where(hashpath: params[:id]).first
    @editor_id = @editor.id

    @content = params[:editor][:content]
    @username = current_user.username.username

    @editor.set_content(@content, @username)

    respond_to do |format|
      format.js
    end 
  end

end
