class SetGroup < ActiveRecord::Base
  belongs_to :routine
  belongs_to :exercise

  def self.new_for_exercise exercise_name, options = {}
    routine = self.new options
    routine.exercise_id = (Exercise.find_or_create_by name: exercise_name, increase_per_session: 5).id
    routine
  end
end
