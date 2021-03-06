# By: Mathew Allen
# Mostly generated by rake
# Defines the database migration
class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :type
      t.string :name
      t.text :description
      t.timestamps null: false
    end
    add_reference :achievements, :user, index: true
  end
end
