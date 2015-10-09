# By: Mathew Allen
# Defines common functionality for api controllers
class Api::V1::BaseController < ApplicationController
  include Pundit
  include ActiveHashRelation

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :destroy_session

  rescue_from ActiveRecord::RecordNotFound, with: :not_found!
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized!

  attr_accessor :current_user,
   :model,
   :modelName,
   :modelNamePlural,
   :serializer
   
   # Metaprogram to figure out the model to use :)
   def initialize
     @modelName = @class.name.sub('Controller', '')
     @modelNamePlural = @model.pluralize
     @model = @modelName.constantize
     @serializer = (@modelName + 'Serializer').constantize
   end

   def index
     users = User.all.order(created_at: :asc)

     users = apply_filters(users, params)

     users = paginate(users)

     users = policy_scope(users)

     render(
       json: ActiveModel::ArraySerializer.new(
         users,
         each_serializer: Api::V1::UserSerializer,
         root: 'users',
         meta: meta_attributes(users)
       )
     )
   end

  protected
  def destroy_session
    request.session_options[:skip] = true
  end

  def unauthenticated!
    response.headers['WWW-Authenticate'] = 'Token realm=Application'
    render json: { error: 'Bad credentials' }, status: 401
  end

  def unauthorized!
    render json: { error: 'not authorized' }, status: 403
  end

  def invalid_resource!(errors = [])
    api_error(status: 422, errors: errors)
  end

  def not_found!
    api_error(status: 404, errors: 'Not found')
  end

  def api_error(status: 500, errors: [])
    unless Rails.env.production?
      puts errors.full_messages if errors.respond_to? :full_messages
    end
    head(status: status) && return if errors.empty?

    render json: jsonapi_format(errors).to_json, status: status
  end

  def paginate(resource)
    resource = resource.page(params[:page] || 1)
    resource = resource.per_page(params[:per_page]) if params[:per_page]

    resource
  end

  # expects pagination!
  def meta_attributes(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page,
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end

  def authenticate_user!
    token = params[:token]
    token ||= request.headers['X-Access-Token']
    user = User.find_by authentication_token: token
    if user
      @current_user = user
    else
      return unauthenticated!
    end
  end

  private

  def jsonapi_format(errors)
    return errors if errors.is_a? String
    errors_hash = {}
    errors.messages.each do |attribute, error|
      array_hash = []
      error.each do |e|
        array_hash << { attribute: attribute, message: e }
      end
      errors_hash.merge! { attribute n => array_hash }
    end

    errors_hash
  end
end
