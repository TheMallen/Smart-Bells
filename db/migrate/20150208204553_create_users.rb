# _create_users.rb
# By: Mathew Allen
# Mostly generated by rake
# Defines the database migration to create the users table in the database
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
