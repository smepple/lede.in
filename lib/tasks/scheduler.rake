desc "This task is called by the Heroku scheduler add-on"

task get_folders: :environment do
  @users = User.all
  for @user in @users do
    @folders = @user.get_folder_list
    i = 0
    while i < @folders.count do
      @folder = Folder.new
      @folder.user_id = @user.id
      @folder.folder_id = @folders[i]["folder_id"]
      @folder.position = @folders[i]["position"]
      @folder.sync_to_mobile = @folders[i]["sync_to_mobile"]
      @folder.title = @folders[i]["title"]
      @folder.folder_type = @folders[i]["type"]
      @folder.save! if @folder.valid?
      i += 1
    end
  end
end

task get_bookmarks: :environment do
  @users = User.all
  for @user in @users do
    @bookmarks = @user.get_bookmarks_list(10)
    i = 0
    while i < @bookmarks.count do
      @bookmark = Bookmark.new
      @bookmark.user_id = @user.id
      @bookmark.bookmark_id = @bookmarks[i]["bookmark_id"]
      @bookmark.description = @bookmarks[i]["description"]
      @bookmark.bookmark_hash = @bookmarks[i]["hash"]
      @bookmark.private_source = @bookmarks[i]["private_source"]
      @bookmark.progress = @bookmarks[i]["progress"]
      @bookmark.progress_timestamp = @bookmarks[i]["progress_timestamp"]
      @bookmark.starred = @bookmarks[i]["starred"]
      @bookmark.time = @bookmarks[i]["time"]
      @bookmark.title = @bookmarks[i]["title"]
      @bookmark.bookmark_type = @bookmarks[i]["type"]
      @bookmark.url = @bookmarks[i]["url"]
      @bookmark.save! if @bookmark.valid?
      i += 1
    end
  end
end