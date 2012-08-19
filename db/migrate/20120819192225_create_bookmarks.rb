class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :bookmark_id
      t.string :description
      t.string :hash
      t.boolean :private_source
      t.float :progress
      t.timestamp :progress_timestamp
      t.boolean :starred
      t.timestamp :time
      t.string :title
      t.string :bookmark_type
      t.string :url

      t.timestamps
    end
  end
end
