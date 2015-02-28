class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :increase_per_session

      t.timestamps null: false
    end
  end
end
