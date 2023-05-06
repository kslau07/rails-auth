class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # binding.break

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now[:notice] = 'Email or password is invalid.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    # binding.break

    # We can reset the entire session (according to video) (???)
    # reset_session
    redirect_to root_url, notice: 'Logged out!'
  end
end
