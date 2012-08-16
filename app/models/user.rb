# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  x_auth_uid             :integer
#  x_auth_username        :string(255)
#  x_auth_password_digest :string(255)
#  oauth_token            :string(255)
#  oauth_token_secret     :string(255)
#  email                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :x_auth_uid,
                  :x_auth_username,
                  :oauth_token, 
                  :oauth_token_secret, 
                  :email

  before_save { |user| user.email = email.downcase if email }

  validates :x_auth_uid, 
            :x_auth_username, 
            :oauth_token, 
            :oauth_token_secret, presence: true, uniqueness: { case_sensitive: false }

  validates :email, format: { with: VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true,
                    allow_nil: true
end
