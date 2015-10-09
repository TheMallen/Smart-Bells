class Api::V1::WorkoutSessionsController < Api::V1::BaseController
  before_filter :authenticate_user!

  def index
    workoutSessions = apply_filters(workoutSessions, params)

    workoutSessions = paginate(workoutSessions)

    workoutSessions = policy_scope(workoutSessions)

    render(
      json: ActiveModel::ArraySerializer.new(
        workoutSessions,
        each_serializer: Api::V1::WorkoutSessionSerializer,
        root: 'workout_sessions',
        meta: meta_attributes(workoutSessions)
      )
    )
  end

  def show
    workout = WorkoutSession.find(params[:id])
    authorize workout

    render json: Api::V1::WorkoutSessionSerializer.new(workout).to_json
  end

  def create
    workout = WorkoutSession.new(create_params)
    return api_error(status: 422, errors: workout.errors) unless workout.valid?

    workout.save!

    render(
      json: Api::V1::WorkoutSessionSerializer.new(workout).to_json,
      status: 201,
      location: api_v1_workout_path(workout.id),
      serializer: Api::V1::WorkoutSessionSerializer
    )
  end

  def update
    workout = WorkoutSession.find(params[:id])

    authorize workout

    if !workout.update_attributes(update_params)
      return api_error(status: 422, errors: workout.errors)
    end

    render(
      json: Api::V1::WorkoutSessionSerializer.new(workout).to_json,
      status: 200,
      location: api_v1_workout_path(workout.id),
      serializer: Api::V1::WorkoutSessionSerializer
    )
  end

  def destroy
    workout = WorkoutSession.find(params[:id])

    authorize workout

    if !workout.destroy
      return api_error(status: 500)
    end

    head status: 204
  end

  private

  def create_params
     params.require(:workout).permit(
       :content, :picture, :user_id
     )
  end

  def update_params
    create_params
  end
end
