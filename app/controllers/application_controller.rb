class ApplicationController < ActionController::Base

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Explicitly shares something defined in a controller with any view
  helper_method :current_user

  # this is enabled by default in Rails 5.2+, no need to explicitly state it
  # protect_from_forgery

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
