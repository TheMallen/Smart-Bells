# personal_record.rb
# model for top scores of a user for a given exercise
class PersonalRecord < ActiveRecord::Base
  attr_reader :exercise_name

  def exercise_name
    exercise.name
  end
  # Set up the associations for this exercise
  belongs_to :user
  belongs_to :exercise

  # Static methods
  class << self
    # create a pr for the set_group given
    def new_for_set_group set_group, options = {}
      pr = PersonalRecord.find_or_initialize exercise_id: set_group.exercise_id,
                                             user_id: set_group.user_id
      pr.update resistance: set_group.resistance
    end
  end

end
