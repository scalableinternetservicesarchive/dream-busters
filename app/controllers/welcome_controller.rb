class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user
      @user = current_user
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end

    if @user.user_name.nil?
      @username = UserName.create(name: @user.email.partition("@").first)
      @user.user_name = @username
    end
    # if UserName.where(user_id: @user.id).empty?
    #   @username = UserName.create(username: @user.email.partition("@").first)
    #   @user.username = @username
    # end

    @editors = @user.editors.all
  end

end
