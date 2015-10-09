class Api::V1::ExercisesController < Api::V1::ResourceController
  before_filter :authenticate_user!

  protected

  def create_params
    params
      .require('exercise')
      .permit :name,
              :increase_per_session,
              :user_id,
              :is_public
  end

  def update_params
    create_params
  end
end
