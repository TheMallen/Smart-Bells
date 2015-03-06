# RoutinesController.rb
# Author: Mathew Allen
# Controller which sets up resourceful actions for interacting with routine models.
class RoutinesController < ApplicationController

  include Securable


  # The new action creates a new workout routine to bind to the form
  # rails will then magically render the corresponding template
  def new
    @routine = Routine.new
    @routine.set_groups << SetGroup.new
  end

  # The create action creates a new workout routine from the POST data
  # and attempts to persist it
  def create
    @routine = Routine.new routine_params
    @routine.user = current_user
    if @routine.save
      redirect_to user_url current_user
    else
      render 'new'
    end
  end

  # Finds and attaches the session by id
  # magically renders the corresponding view
  def show
    @routine = Routine.find params[:id]
  end

  # Displays the edit form for the desired routine
  # Only allows the user's owner to view
  def edit
    @routine = Routine.find params[:id]
    require_owner_of @routine
  end

  # Performs update for the desired routine
  # Only allows the user's owner to view
  def update
    @routine = Routine.find params[:id]
    require_owner_of @routine
    @routine.set_groups.clear
    if @routine.update_attributes(routine_params)
      redirect_to current_user
      flash[:success] = "Routine #{@routine.name} Saved"
    else
      render 'edit'
    end
  end

  # Does nothing in this build
  def destroy
    Routine.find(params[:id]).destroy
    redirect_to current_user
  end

  # Merely displays the appropriate view
  def choose
  end

  # Defines the modifiable attributes on this model
  def routine_params
    params.require(:routine)
          .permit :name,
                  set_groups_attributes: [
                    :reps_per_set,
                    :number_of_sets,
                    :exercise_id,
                    ]

  end

end
