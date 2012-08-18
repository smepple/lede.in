class RemoveXAuthPasswordFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :x_auth_password_digest
  end
end
