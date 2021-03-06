=begin
Sessionable.rb

A concern which can be mixed into a controller to give it functionality to work with sessions.
Based on the SessionHelper from the Ruby on Rails tutorial, however given that according to
the Rails documentation, Helpers are supposed to be specifically for view functionality, I thought
it made more sense to model as a non-helper mixin. This way things like log_in that are clearly
not presentation operations can be kept appropriately scoped.

by: Mathew Allen
=end

module Sessionable

  # Callback for when this mixin is included into a controller
  def self.included base
    # This method needs to be accessible to the view layer
    base.helper_method :current_user
    # This method also needs to be accessible to the view layer
    base.helper_method :logged_in?
  end

  # Stores the given user's id in session cookies
  def log_in user
    file = File.open("silly_log.txt", "w")
    file.puts "#{user.email} logged in"
    file.close
    session[:user_id] = user.id
  end

  # Returns the cached user or finds it based on session data
  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  # Destroys the session data resets the current user to nil
  def log_out
    file = File.open("silly_log.txt", "w")
    file.puts "#{current_user.email} logged out"
    file.close
    session[:user_id] = nil
    @current_user = nil
  end

  # Returns true if logged in, false otherwise
  def logged_in?
    !session[:user_id].nil?
  end


end
