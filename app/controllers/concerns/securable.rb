=begin
Sessionable.rb

A concern which can be mixed into a controller to bar access to specific pages
Relies on the sessionable concern

by: Mathew Allen
=end

module Securable

  # redirects to login if the user is not logged in
  # meant to be used as a before_action filter
  def require_login
    unless logged_in?
      flash[:danger] = "Please login"
      redirect_to login_url # redirect to login
    end
  end

  # only allows access if the current user is the one passed in
  # use this function to check if a user is the owner of a resource
  # or to check if a user is operating on themselves
  # meant to be used inside an action
  def require_logged_in_as user
    unless current_user == user
      flash[:danger] = "Must be logged in as the correct user"
      redirect_to login_url
    end
  end

  # only allow access if the current user owns this resource
  def require_owner_of item
    # if the item is a user we need to BE them
    return require_logged_in_as item if item.class == User
    unless current_user == item.user
      flash[:danger] = "Must be logged in as the resource's owner"
      redirect_to login_url
    end
  end
end
