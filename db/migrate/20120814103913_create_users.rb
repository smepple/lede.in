class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :x_auth_uid
      t.string :x_auth_username
      t.string :x_auth_password_digest
      t.string :oauth_token
      t.string :oauth_token_secret
      t.string :email

      t.timestamps
    end
  end
end
