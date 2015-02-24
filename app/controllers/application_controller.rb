# application_controller.rb
# Author: Mathew Allen
# Dummy controller to serve the pages that don't need server logic
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  # All controllers inheriting from ApplicationController have access
  # to session operations
  include Sessionable
end
