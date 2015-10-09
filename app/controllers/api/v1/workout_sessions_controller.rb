class Api::V1::WorkoutSessionsController < Api::V1::BaseController
  before_filter :authenticate_user!

  protected

  def create_params
    params
      .require(:workout_session)
      .permit :name,
              :is_public,
              workout_set_groups_attributes: [
                :reps_per_set,
                :number_of_sets,
                :exercise_id
              ]
  end

  def update_params
    create_params
  end
end