class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user
      @user = current_user
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end

    # if @user.username.nil?
    #   @username = Username.create(username: @user.email.partition("@").first)
    #   @user.username = @username
    # end
    if Username.where(user_id: @user.id).empty?
      @username = Username.create(username: @user.email.partition("@").first)
      @user.username = @username
    end

    @editors = @user.editors.all
  end

end
