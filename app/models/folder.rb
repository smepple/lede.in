# == Schema Information
#
# Table name: folders
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  folder_id      :integer
#  position       :integer
#  sync_to_mobile :boolean
#  title          :string(255)
#  folder_type    :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Folder < ActiveRecord::Base
  
  belongs_to :user

  validates :user_id, :folder_id, :title, presence: true

  validates :folder_id, uniqueness: true
end
