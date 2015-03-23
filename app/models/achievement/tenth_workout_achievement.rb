#
# TenthWorkoutAchievement.rb
# By Mathew Allen
# This achievement is for people who have done both 5x5 days
#
class TenthWorkoutAchievement < Achievement

  # set default values
  def default_values!
    self.name ||= "Tenth Workout."
    self.description ||= "You've kept it up for 10 sessions. :)"
  end

  # check if the user has done both 5x5 days
  def self.condition_met? user
    user.workout_sessions.count >= 10
  end

end
