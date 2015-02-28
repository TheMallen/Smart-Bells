class AddAssociationsForRoutines < ActiveRecord::Migration
  def change
    add_reference :set_groups, :exercise, index: true
    add_reference :set_groups, :routine, index: true
    add_reference :routines, :user, index: true
  end
end
