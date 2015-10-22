class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user.nil?
      #error handle?
      redirect_to new_session_url
      return
    end
    session[:session_token] = @user.reset_session_token!
    redirect_to user_url(@user)
  end

  def destroy
    unless current_user.nil?
      current_user.reset_session_token!
    end
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
