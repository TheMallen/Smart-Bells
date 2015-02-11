class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  # All controllers inheriting from ApplicationController have access
  # to session operations
  include Sessionable
end
