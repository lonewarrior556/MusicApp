class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def logged_in?
    return false if session[:session_token].nil?
    !!current_user
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def redirect_loggedin
    redirect_to root_url if logged_in?
  end

  def require_login
    redirect_to root_url if !logged_in?
  end



end
