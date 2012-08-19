class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.integer :user_id
      t.integer :folder_id
      t.integer :position
      t.boolean :sync_to_mobile
      t.string :title
      t.string :type

      t.timestamps
    end
  end
end
