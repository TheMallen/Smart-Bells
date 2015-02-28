class Exercise < ActiveRecord::Base
  has_many :set_groups
  has_many :routines, through: :set_groups
  has_many :workout_sets
  has_many :workout_sessions, through: :workout_sets
end
