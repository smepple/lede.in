class RenameFoldersTypeToFolderType < ActiveRecord::Migration
  def change
    rename_column :folders, :type, :folder_type
  end
end
