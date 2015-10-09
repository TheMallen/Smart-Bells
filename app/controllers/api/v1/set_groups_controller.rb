class Api::V1::SetGroupsController < Api::V1::ResourceController
  before_filter :authenticate_user!

  protected
  def create_params
    params
      .require(:set_group)
      .permit :resistance,
              :number_of_sets,
              :reps_per_set,
              :exercise_id,
              :routine_id
  end

  def update_params
    create_params
  end
end
