class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user
      @user = current_user
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end

    @editors = @user.editors.all
  end
end
