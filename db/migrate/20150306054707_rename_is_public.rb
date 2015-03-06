class RenameIsPublic < ActiveRecord::Migration
  def change
    rename_column :routines, :isPublic, :is_public
    rename_column :exercises, :isPublic, :is_public
  end
end
