# app/models/observers/puts_observer.rb
# test observer outputs to logs
class PutsObserver < ActiveRecord::Observer
  observe :workout_session

  # After saving a workout_session the observer logs to the app log file
  def after_save workout_session
    Rails.logger.debug "User #{workout_session.user} created session #{workout_session.attributes.inspect}"
  end
end
