class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session.has_key? :user_id
  end

  helper_method :current_user
  private
  def require_login
    redirect_to new_login_path if current_user == nil

  end
end
