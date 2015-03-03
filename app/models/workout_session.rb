# workout_session.rb
# A model which represents some time spent at a gym
# Can be based on a routine or (down the line) custom
class WorkoutSession < ActiveRecord::Base
  # set up the associations
  belongs_to :user
  has_many :workout_set_groups
  has_many :exercises, through: :workout_set_groups
  accepts_nested_attributes_for :workout_set_groups

  # Creates a workout session for the specified routine
  def self.new_for_routine routine_name, user
    session = WorkoutSession.new user: user, name: routine_name

    routine = Routine.find_by name: routine_name

    # We need to generate a new workout set group for each abstract set group
    routine.set_groups.each do |set_group|
      resistance = WorkoutSetGroup.next_resistance_for_exercise set_group.exercise, user
      options = {}
      if resistance
        options.resistance = resistance
      end
      wsg = WorkoutSetGroup.new_for_set_group set_group, resistance
      session.workout_set_groups << wsg
    end

    session
  end

end
