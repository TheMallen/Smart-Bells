class CreatePersonalRecords < ActiveRecord::Migration
  def change
    create_table :personal_records do |t|
      t.integer :resistance

      t.timestamps null: false
    end
  end
end
