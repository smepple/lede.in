# == Schema Information
#
# Table name: bookmarks
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  bookmark_id        :integer
#  description        :string(255)
#  hash               :string(255)
#  private_source     :boolean
#  progress           :float
#  progress_timestamp :datetime
#  starred            :boolean
#  time               :datetime
#  title              :string(255)
#  bookmark_type      :string(255)
#  url                :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Bookmark < ActiveRecord::Base
  
  belongs_to :user

  validates :user_id, :bookmark_id, :hash, :title, :url, presence: true

  validates :bookmark_id, uniqueness: true
end
