class AddUniquenessIndexToUsersRequiredFields < ActiveRecord::Migration
  def change
    add_index :users, :x_auth_uid, unique: true
    add_index :users, :x_auth_username, unique: true
    add_index :users, :oauth_token, unique: true
    add_index :users, :oauth_token_secret, unique: true
    add_index :users, :email, unique: true
  end
end
