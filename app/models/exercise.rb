# exercise.rb
# Author Mathew Allen
# Model for exercises
# Represents a type of exercise
class Exercise < ActiveRecord::Base

  # set up the associations for this model
  has_many :set_groups
  has_many :routines, through: :set_groups
  has_many :workout_sets
  has_many :workout_sessions, through: :workout_sets

  # Exercise must have a unique name
  validates :name,
    presence: true,
    length: { maximum: 20, minimum: 3 },
    uniqueness: { case_sensitive: false }
end
