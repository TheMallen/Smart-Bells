#
# StartedStrengthAchievement.rb
# By Mathew Allen
# This achievement is for people who have done both 5x5 days
#
class StartedStrengthAchievement < Achievement

  # set default values
  def default_values!
    self.name ||= "Started strength."
    self.description ||= "In the pipe, 5 by 5."
  end

  # check if the user has done both 5x5 days
  def self.condition_met? user
    !user
      .workout_sessions
      .where( name: ['5x5 A Day', '5x5 B Day'] )
      .empty?
  end

end
