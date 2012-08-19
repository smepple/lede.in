class AddIndexesToFolders < ActiveRecord::Migration
  def change
    add_index :folders, :user_id
    add_index :folders, :folder_id
    add_index :folders, [:user_id, :folder_id], unique: true
  end
end
