# ExercisesController.rb
# Author: Mathew Allen
# Controller which sets up resourceful actions for interacting with exercises models.
class ExercisesController < ApplicationController

  include Securable

  # Only logged in users have access to this resource
  before_action :require_login

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new exercise_params
    @exercise.user_id = current_user.id
    if @exercise.save
      flash[:success] = "Exercise #{@exercise.name} created."
      redirect_to user_url current_user
    else
      render 'new'
    end
  end

  def exercise_params
    params.require(:exercise)
          .permit :increase_per_session,
                  :is_public,
                  :name
  end

end
