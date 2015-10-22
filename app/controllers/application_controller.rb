class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    token = self.session[:session_token]
    return nil if token.nil?
    @user ||= User.find_by_session_token(token)
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def authenticate_user!
    redirect_to new_session_url unless logged_in?
  end


end
