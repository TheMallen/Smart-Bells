class Routine < ActiveRecord::Base
  belongs_to :user
  has_many :set_groups
  has_many :exercises, through: :set_groups

  def add_set_group_for_exercise exercise_name, options={}
    group = SetGroup.new_for_exercise exercise_name, options
    group.save
    self.set_groups << group
  end
end
