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

require 'spec_helper'

describe Folder do
  pending "add some examples to (or delete) #{__FILE__}"
end
