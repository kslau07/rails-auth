class ApplicationController < ActionController::Base

  # this is enabled by default in Rails 5.2+, no need to explicitly state it
  # protect_from_forgery

  private

  def current_user
    # change to Cookie below
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  # Explicitly shares something defined in a controller with any view
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end
end
