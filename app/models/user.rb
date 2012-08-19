# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  x_auth_uid         :integer
#  x_auth_username    :string(255)
#  oauth_token        :string(255)
#  oauth_token_secret :string(255)
#  email              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ActiveRecord::Base

  has_many :folders, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :x_auth_uid, 
            :x_auth_username, 
            :oauth_token, 
            :oauth_token_secret, presence: true, uniqueness: { case_sensitive: false }

  validates :email, format: { with: VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true,
                    allow_nil: true

  before_save do |user| 
    user.x_auth_username = x_auth_username.downcase
    match = VALID_EMAIL_REGEX.match(user.x_auth_username)
    user.email = user.x_auth_username if match
    user.email = email.downcase if email
  end

  def self.from_instapaper(auth, cred)
    where("x_auth_uid = #{cred[0]["user_id"]}").first || create_from_instapaper(auth, cred)
  end

  def self.create_from_instapaper(auth, cred)
    create! do |user|
      user.x_auth_uid = cred[0]["user_id"]
      user.x_auth_username = cred[0]["username"]
      user.oauth_token = auth["oauth_token"]
      user.oauth_token_secret = auth["oauth_token_secret"]
    end
  end

  def authorize
    Instapaper.oauth_token = self.oauth_token
    Instapaper.oauth_token_secret = self.oauth_token_secret
  end

  def get_folder_list
    self.authorize
    @folders = Instapaper.folders
  end

  def get_bookmarks_list(limit)
    self.authorize
    @bookmarks = Instapaper.bookmarks("limit" => limit)
    # i = 0
    # while i < @bookmarks.count do
    #   @bookmark = @bookmarks[i]
    #   @bookmark_id = @bookmark["bookmark_id"]
    #   @bookmark_title = @bookmark["title"]
    #   @bookmark_url = @bookmark["url"]
    #   i += 1
    # end
  end
end
