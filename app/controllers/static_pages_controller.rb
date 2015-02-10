# StaticPagesController.rb
# Author: Mathew Allen
# Dummy controller to serve the pages that don't need server logic
class StaticPagesController < ApplicationController
  # The index page for the application
  include Concernable
  def home
  end
end
