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

require 'spec_helper'

describe Bookmark do
  pending "add some examples to (or delete) #{__FILE__}"
end
