=begin
Sessionable.rb

A Helper which provides general purpose view-layer
functions.

by: Mathew Allen
=end
module ApplicationHelper

  # This function outputs a link which intelligently
  # marks itself active if the current page is it's path
  def smart_link_to text, path, options = {}
    if (link_active? path)
      options[:class] = "#{options[:class]} active"
    end
    link_to text, path, options
  end

  # Takes the path and returns "active" if it is the current page
  def link_active path
    "active" if link_active? path
  end

  # Checks if the specified link is the current page
  # essentially a wrapper for current_path?
  def link_active? path
    current_page? path
  end

  # Returns the Gravatar for the given user.
  # From Reference 1
  # Also from http://en.gravatar.com/site/implement
  def gravatar_for user, options = { size: 80 }
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end


end
