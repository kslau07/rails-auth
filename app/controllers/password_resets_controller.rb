class PasswordResetsController < ApplicationController
  def new
  end

  def create
    # binding.break;
    user = User.find_by_email(password_reset_params)
    user&.send_password_reset
    redirect_to root_url, notice: 'Email sent with password reset instructions.'
  end

  private

  def password_reset_params
    params[:email]
  end
end
