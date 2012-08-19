class AddIndexesToBookmarks < ActiveRecord::Migration
  def change
    add_index :bookmarks, :user_id
    add_index :bookmarks, :bookmark_id
    add_index :bookmarks, :hash
    add_index :bookmarks, [:user_id, :bookmark_id], unique: true
    add_index :bookmarks, [:bookmark_id, :hash], unique: true
  end
end
