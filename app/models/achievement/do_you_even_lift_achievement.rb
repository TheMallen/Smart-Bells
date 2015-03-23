#
# DoYouEvenAchievement.rb
# By Mathew Allen
# This achievement is for your first workout.
# Verifying to the world that you do in fact lift.
#
class DoYouEvenLiftAchievement < Achievement

  # set default values
  def default_values!
    self.name ||= 'Do You Even Lift?'
    self.description ||= "You've shown the world that you do in fact lift."
  end

  # check if the user even lifts
  def self.condition_met? user
    not user.workout_sessions.empty?
  end

end
