#
# Achievement.rb
# By Mathew Allen
# represents a base model for achievements
# all achievements should inherit from
#
class Achievement < ActiveRecord::Base
  belongs_to :user
  before_save :default_values!

  # set default values
  # override this in achievements
  def default_values!
    self.name ||= 'DEFAULT ACHIEVEMENT'
    self.description ||= 'This is a default achievement.'
  end

  # Award the user the achievement if it has not been awarded it already
  # And it has net the condition
  def self.check_condition! user
    # Check if achievement is already awarded before doing possibly expensive
    # operations to see if the achievement conditions are met.
    if !user.has_achieved?(self) and self.condition_met? user
      user.achieve(self)
      true
    else
      false
    end
  end

  # static method to check conditions
  # should be overriden in sub classes
  def self.condition_met? user
    raise "Achievments should define their own self.conditions_met?"
  end

end
