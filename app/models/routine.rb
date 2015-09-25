# routine.rb
# Author: Mathew Allen
# Model for a set of workouts, used to define a template
# for workout sessions.
class Routine < ActiveRecord::Base

  # import nameable concern
  include Shared::Nameable

  # setup associations and other model attributes
  belongs_to :user
  has_many :set_groups
  has_many :exercises, through: :set_groups
  accepts_nested_attributes_for :set_groups

  # adds a set group consisting of the given exercise
  def add_set_group_for_exercise exercise_name, options={}
    group = SetGroup.new_for_exercise exercise_name, options
    self.set_groups << group
  end

  # static methods
  class << self
    # helper for chaining queries
    def only_public
      where is_public: true
    end
  end
end
