class CreateSetGroups < ActiveRecord::Migration
  def change
    create_table :set_groups do |t|
      t.integer :number_of_sets
      t.integer :reps_per_set
      t.timestamps null: false
    end
  end
end
