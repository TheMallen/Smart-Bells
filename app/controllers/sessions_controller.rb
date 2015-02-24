# sessions_controller.rb
# Author: Mathew Allen
# The session controller handles logging in and out of a session
class SessionsController < ApplicationController
  # Action for displaying the new session form. (login form)
  # Simply allows rails to display the default view for new
  def new

  end

  # Action for creating a new session
  # Authenticates the data sent in for the user and sets session if authorized
  def create
    # logging in can be done via email or username interchangeably
    user = User.find_by email: params[:session][:username].downcase
    # ||= only runs the find command if the user was not set by the above
    user ||= User.find_by username: params[:session][:username].downcase

    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page
      log_in user
      flash[:success] = "Logged in as #{user.username}"
      redirect_to user_url(user)
    else
      # Flash an error message
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  # Action for logging out (destroying session)
  def destroy
    # Log out the user
    log_out if logged_in?
    flash[:warning] = 'Logged out'
    redirect_to root_url
  end
end
