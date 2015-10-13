# By: Mathew Allen
# Defines common functionality for api controllers which are
# Full resources (abstracting a model)
class Api::V1::ResourceController < Api::V1::BaseController
  attr_accessor :current_user,
                :model,
                :model_name,
                :model_name_plural,
                :serializer

  # Metaprogram to figure out the model to use :)
  def initialize
    super
    @model_name ||= controller_name.singularize
    @model ||= @model_name.camelize.constantize
    @model_name_plural ||= @model_name.pluralize
    @created_path ||= "api_v1_#{@model_name.downcase}_path"
    @serializer ||= Api::V1.const_get("#{@model.name}Serializer")
  end

  def index
    records = filtered_records
    render_list filtered_records
  end

  def show
    record = @model.find(params[:id])
    render(json: @serializer.new(record).to_json)
  end

  def create
    record = @model.new(create_params)
    if create_with_current_user
      record.user = current_user
    end
    return api_error(status: 422, errors: record.errors) unless record.valid?
    record.save!

    render(
      json: @serializer.new(record).to_json,
      status: 201,
      location: eval("#{@created_path}(#{record.id})")
    )
  end

  def update
    record = @model.find(params[:id])
    authorize record

    unless record.update_attributes(update_params)
      return api_error(status: 422, errors: record.errors)
    end

    render(
      json: @serializer.new(record).to_json,
      status: 200,
      location: eval("#{@created_path}(#{user.id})"),
      serializer: @serializer
    )
   end

  def destroy
    record = @model.find(params[:id])

    return api_error(status: 500) unless record.destroy

    head status: 204
  end

  protected

  def render_list(records, options={})
    render(
      json: ActiveModel::ArraySerializer.new(
        records,
        status: 200,
        each_serializer: @serializer,
        root: @model_name_plural.downcase,
        meta: meta_attributes(records)
      )
    )
  end

  def filtered_records
    records = @model.all.order(created_at: :asc)
    records = apply_filters(records, params)
    records = paginate(records)
    records = policy_scope(records)
  end

  def create_with_current_user
    false
  end
end
