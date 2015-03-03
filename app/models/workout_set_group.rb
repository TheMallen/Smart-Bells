# workout_set_group.rb
# a model which represents a set group actually performed
# during a workout session
# will usually be built based on a set group.
class WorkoutSetGroup < ActiveRecord::Base
  # setup the associations
  belongs_to :workout_session
  belongs_to :exercise

  # create a workout set group from a set group template
  def self.new_for_set_group set_group, options = {}
    wsg = WorkoutSetGroup.new options
    wsg.number_of_sets = set_group.number_of_sets
    wsg.reps_per_set = set_group.reps_per_set
    wsg.exercise = set_group.exercise
    wsg
  end

  # Create a new set for the given exercise, based on your most recent stat
  def self.new_for_exercise_name exercise_name, options = {}
    workout_set = WorkoutSetGroup.new options
    exercise_id = (Exercise.find_or_create_by name: exercise_name, increase_per_session: 5).id
    workout_set.exercise_id = exercise_id
    workout_set
  end

  # Create a new workout set group for the given exercise
  def self.new_for_exercise exercise, options = {}
    workout_set = WorkoutSetGroup.new options
    workout_set.exercise = exercise
    workout_set
  end

  # Find any prs for the given xercise, if there are any
  def self.next_resistance_for_exercise exercise, user
    PersonalRecord.find_by exercise_id: exercise.id, user_id: user.id
  end


  # Find any prs for the given xercise, if there are any
  def self.next_resistance_for_exercise_name exercise_name, user_id
    exercise_id = (Exercise.find_by name: exercise_name).id
    PersonalRecord.find_by exercise_id: exercise_id, user_id: user_id
  end

end
