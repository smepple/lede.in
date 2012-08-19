class RenameBookmarksHashToBookmarkHash < ActiveRecord::Migration
  def change
    rename_column :bookmarks, :hash, :bookmark_hash
  end
end
