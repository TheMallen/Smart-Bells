class Api::V1::RoutinesController < Api::V1::BaseController
  before_filter :authenticate_user!

  protected

  def filtered_records
    records = @model
                .includes(:set_groups, :exercises)
                .all.order(created_at: :asc)
    records = apply_filters(records, params)
    records = paginate(records)
    records = policy_scope(records)
  end

  def create_params
    params
      .require(:routine)
      .permit :name,
              :is_public,
              set_groups_attributes: [
                :reps_per_set,
                :number_of_sets,
                :exercise_id
              ]
  end

  def update_params
    create_params
  end
end
