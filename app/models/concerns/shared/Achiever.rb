##
# Achiever.rb
# By Mathew Allen
# A concern for anything which can be awarded achievments.
##
module Shared::Achiever
  extend ActiveSupport::Concern

  # set up the association when this concern is included
  included do
    has_many :achievements
  end

  # achieve takes in a class, instantiates it, and attaches it to the Achiever
  def achieve achievement
    achievements << achievement.new
  end

  # has_achieved? returns the result of whether or not an ahievment of this type
  # exists in the list
  def has_achieved? achievement
    !achievements
      .where( type: achievement.name )
      .empty?
  end
end
