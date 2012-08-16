# configuration for Instapaper API gem
Instapaper.configure do |config|
  # config.oauth_token = '5ydiJjpCEnB8RQ7kVmIF6c6MNIwDlVARKFpfmzWEPRWcHRK0te'
  # config.oauth_token_secret = 'MSmlscLnlieuzLvimpXAJcD5Uc0OLPO4xldju2VtcRRvg1RWql'
  config.consumer_key = '1NZbsWfC8sWe2vd1OVN5d1L2c7c8wcombcUhvIDkcMF77iQGVF'
  config.consumer_secret = '6smh2ZeF79K0tamjs0vs2Tqvg8w1ExzqP7tR2qRETinEVBy8tq'
end

# Instapaer credentials
# OAuth consumer key: 1NZbsWfC8sWe2vd1OVN5d1L2c7c8wcombcUhvIDkcMF77iQGVF
# OAuth consumer secret: 6smh2ZeF79K0tamjs0vs2Tqvg8w1ExzqP7tR2qRETinEVBy8tq

# Authentication
# To obtain an access token via xAuth:

# Instapaper.access_token(username, password)
# You can also verify credentials once you have received tokens:

# Instapaper.verify_credentials
# Bookmark Operations
# Retrieve a list of bookmarks:

# Instapaper.bookmarks
# Add a new bookmark:

# Instapaper.add_bookmark('http://someurl.com', :title => 'This is the title', :description => 'This is the description')
# Remove a bookmark:

# Instapaper.delete_bookmark(bookmark_id)
# Update read progress:

# Instapaper.update_read_progress(bookmark_id, 0.5)
# Star/Un-star a bookmark:

# Instapaper.star(bookmark_id)
# Instapaper.unstar(bookmark_id)
# Archive/Un-archive a bookmark:

# Instapaper.archive(bookmark_id)
# Instapaper.unarchive(bookmark_id)
# Move a bookmark to a folder:

# Instapaper.move(bookmark_id, folder_id)
# Obtain the text of a bookmark:

# Instapaper.text(bookmark_id)
# Folder Operations
# To obtain the list of folders:

# Instapaper.folders
# You can add by passing a name:

# Instapaper.add_folder('eventmachine')
# And remove folders by referencing a folder by it's id.

# Instapaper.delete_folder(folder_id)
# Lastly, the folders can be reordered:

# Instapaper.set_order(['folder_id1:2','folder_id2:1'])
# Restrictions
# Users without an Instapaper Subscription may only invoke the following calls:

# Instapaper.access_token
# Instapaper.verify_credentials
# Instapaper.add_bookmark
# Instapaper.folders