class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save

      # After creating/saving, set session id immediately
      # (log in user immediately after they sign up)
      session[:user_id] = @user.id

      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
