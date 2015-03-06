# set_group.rb
# Model for templates of workout set groups
# used to define a template for a workout set
# for example if I want to do 5 sets of something every week
# I would create a setgroup representing this
class SetGroup < ActiveRecord::Base
  belongs_to :routine
  belongs_to :exercise

  validates :reps_per_set,
    presence: true,
    numericality: { only_integer: true }

  validates :number_of_sets,
    presence: true,
    numericality: { only_integer: true }

  def self.new_for_exercise exercise_name, options = {}
    set_group = SetGroup.new options
    set_group.exercise_id = (Exercise.find_or_create_by name: exercise_name, increase_per_session: 5).id
    set_group
  end
end
