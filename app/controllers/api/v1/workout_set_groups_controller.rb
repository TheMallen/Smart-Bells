class Api::V1::WorkoutSetGroupsController < Api::V1::BaseController
  before_filter :authenticate_user!

  protected

  def create_params
    params
    .require(
      :resistance,
      :number_of_sets,
      :reps_per_set,
      :exercise_id,
      :workout_session_id
    )
  end

  def update_params
    create_params
  end
end
