# workout_session.rb
# A model which represents some time spent at a gym
# Can be based on a routine or (down the line) custom
class WorkoutSession < ActiveRecord::Base
  # always sort by created_at unless otherwise specified
  default_scope do
    order created_at: :desc
  end

  # set up the associations
  belongs_to :user
  has_many :workout_set_groups
  has_many :exercises, through: :workout_set_groups
  accepts_nested_attributes_for :workout_set_groups

  # Is not nameable because the name field is not unique
  validates :name,
    presence: true

  # static methods
  class << self
    # Creates a workout session for the specified routine
    def new_for_routine routine_name, user
      session = WorkoutSession.new user: user, name: routine_name

      routine = Routine.find_by name: routine_name

      # We need to generate a new workout set group for each abstract set group
      routine.set_groups.each do |set_group|
        resistance = WorkoutSetGroup.next_resistance_for_exercise set_group.exercise, user
        options = {}
        if resistance
          options[:resistance] = resistance
        end
        wsg = WorkoutSetGroup.new_for_set_group set_group, options
        session.workout_set_groups << wsg
      end

      session
    end

    # simple helper for chaining queries
    def recent
      since 1.month.ago
    end

    # also a helper for chaining queries
    def one
      limit 1
    end

    # helper for chaining queriess
    def since time
      where "created_at >= ?", time
    end

  end
end
