# WorkoutSessionsController.rb
# Author: Mathew Allen
# Controller which sets up resourceful actions for interacting with workout_session models.
class WorkoutSessionsController < ApplicationController

  include Securable

  # Only logged in users have access to this resource
  before_action :require_login

  # Displays all routines currently in the system as options for a new workout
  def choose_routine
    @choices = Array.new
    # Later we will want to filter this
    @choices = current_user.routines + Routine.all.only_public
  end

  def new_for_routine
    @workout_session = WorkoutSession.new_for_routine params[:routine], current_user
  end

  # The new action creates a new workout session to bind to the form
  # rails will then magically render the corresponding template
  def new
    @workout_session = WorkoutSession.new
  end

  # The create action creates a new workout session from the POST data
  # and attempts to persist it
  def create
    @workout_session = WorkoutSession.new workout_session_params
    @workout_session.user = current_user
    if @workout_session.save
      flash[:success] = "Workout Session #{@workout_session.name} logged!"
      redirect_to user_url current_user
    else
      render 'new_for_routine'
    end
  end

  # Finds and attaches the session by id
  # magically renders the corresponding view
  def show
    @workout_session = WorkoutSession.find params[:id]
  end

  # Displays the edit form for the desired session
  # Only allows the user's owner to view
  def edit
    @workout_session = WorkoutSession.find params[:id]
    require_owner_of @workout_session
  end

  # Performs update for the desired session
  # Only allows the user's owner to view
  def update
    @workout_session = WorkoutSession.find params[:id]
    require_owner_of @workout_session
    if @workout_session.update_attributes(workout_session_params)
      redirect_to current_user
      flash[:success] = "Workout Session Saved"
    else
      render 'edit'
    end
  end

  # Does nothing in this build
  def delete
  end

  # Merely displays the appropriate view
  def choose
  end

  # Defines the modifiable attributes on this model
  def workout_session_params
    params.require(:workout_session)
          .permit :name,
                  workout_set_groups_attributes: [
                    :reps_per_set,
                    :number_of_sets,
                    :exercise_id,
                    :resistance]

  end

end
