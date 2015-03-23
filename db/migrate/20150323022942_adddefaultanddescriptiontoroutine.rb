class Adddefaultanddescriptiontoroutine < ActiveRecord::Migration
  def change
    change_column :routines, :is_public, :boolean, :default => false
  end
end
