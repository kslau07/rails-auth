class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    # if user&.authenticate(params[:password]) # this is the preferred syntax for "safe navigation"
    if user && user.authenticate(params[:password])

      # Change from session to cookie
      # session[:user_id] = user.id

      # .permanent makes the cookie permanent (?)
      # Appears to set a 20 year expiration
      # cookies.permanent[:auth_token] = user.auth_token

      # Set expiry with this syntax:
      # cookies.permanent[:token] = {
      #   value: SecureRandom.random_number,
      #   domain: "mydomain",
      #   expires: 1.day.from_now.utc
      #  }

      if params[:remember_me] == 'yes'
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end

      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now[:notice] = 'Email or password is invalid.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # log out
    # session[:user_id] = nil
    cookies.delete(:auth_token)

    # We can reset the entire session (according to video) (???)
    # reset_session
    redirect_to root_url, notice: 'Logged out!'
  end
end
