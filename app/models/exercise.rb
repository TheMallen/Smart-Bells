# exercise.rb
# Author Mathew Allen
# Model for exercises
# Represents a type of exercise
class Exercise < ActiveRecord::Base

  include Shared::Nameable

  # set up the associations for this model
  has_many :set_groups
  has_many :routines, through: :set_groups
  has_many :workout_sets
  has_many :workout_sessions, through: :workout_sets
  belongs_to :user
  validates :increase_per_session,
    presence: true
end
