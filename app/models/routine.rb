# routine.rb
# Author: Mathew Allen
# Model for a set of workouts, used to define a template
# for workout sessions.
class Routine < ActiveRecord::Base

  include Nameable

  belongs_to :user
  has_many :set_groups
  has_many :exercises, through: :set_groups
  accepts_nested_attributes_for :set_groups

  def add_set_group_for_exercise exercise_name, options={}
    group = SetGroup.new_for_exercise exercise_name, options
    self.set_groups << group
  end

  class << self
    def only_public
      where is_public: true
    end
  end
end
