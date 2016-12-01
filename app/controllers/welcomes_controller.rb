class WelcomesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  layout false, only: [:index]
  def index
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end

    if @user.username.nil?
      @username = Username.create(username: @user.email.partition("@").first)
      @user.username = @username
    end

    @editors = @user.editors.order(:created_at)
    @editors = Kaminari.paginate_array(@editors).page(params[:page]).per(5)

  end

end
