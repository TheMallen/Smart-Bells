# app/models/observers/workout_session_achievement_observer.rb
class WorkoutSessionAchievementObserver < ActiveRecord::Observer
  observe :workout_session

  # After saving a workout_session....
  def after_save workout_session
    # A hack to make this introspection work on dev
    Rails.application.eager_load!
    # Use metaprogramming and polymorphism to check all achievements
    Achievement.subclasses.each do |achievement|
      achievement.check_condition! workout_session.user
    end
  end
end
