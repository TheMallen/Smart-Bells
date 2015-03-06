class AddUserRefToExerciseAndPublicFieldsToThings < ActiveRecord::Migration
  def change
    add_reference :exercises, :user, index: true
    add_column :exercises, :isPublic, :boolean, index: true
    add_column :routines, :isPublic, :boolean, index: true
  end
end
