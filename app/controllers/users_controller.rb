# UsersController.rb
# Author: Mathew Allen
# Controller which sets up resourceful actions for interacting with user models.
class UsersController < ApplicationController

  include Securable
  # The new action creates a new user to bind to the form
  # rails will then magically render the corresponding template
  def new
    @user = User.new
  end

  # The create action creates a new user from the POST data
  # and attempts to persist it
  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = "Logged in #{@user.username}!"
      redirect_to user_url @user
    else
      render 'new'
    end
  end

  # Finds and attaches the user by id
  # magically renders the corresponding view
  def show
    # For now we secure the show field
    requested_user = User.find params[:id]
    require_owner_of requested_user
    @user = User.find params[:id]
  end

  private

  # Defines the modifiable attributes on this model
  def user_params
    params.require(:user)
          .permit :username,
                  :email,
                  :password,
                  :password_confirmation

  end
end
