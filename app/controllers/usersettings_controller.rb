class UsersettingsController < ApplicationController
  def change_password
    if current_user
      @user = current_user
    else
      redirect_to new_user_session_path, alert: 'You are not logged in.'
    end
  end

  def change_username
    if current_user
      @user = current_user
      @username = @user.username
    else
      redirect_to new_user_session_path, alert: 'You are not logged in.'
    end
  end

  def update_username
    unless params[:username].nil?
      @username = Username.find(params[:id])
      @username.update(params.require(:username).permit(:username))
      return redirect_to welcomes_path, notice: "Username changed successfully"
    end
    render "update_username", notice: "Invalid username"
  end

  def update_password
    unless params[:id].nil?
      @user = User.find(params[:id])
      if @user.update(params.require(:user).permit(:password, :password_confirmation))
        redirect_to welcomes_path, notice: "User password changed successfully"
      else
        redirect_to change_password_path, alert: "User password fail to change"
      end
    end
  end


end
