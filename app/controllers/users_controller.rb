class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    user.reset_session_token!
    session[:session_token] = user.session_token
    if user.save!
      render text: "Success!"
    else
      #error handler?
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
