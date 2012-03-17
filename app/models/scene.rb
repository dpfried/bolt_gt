class Scene < ActiveRecord::Base
  attr_accessible :schematic, :image
  mount_uploader :image, ImageUploader
end

# == Schema Information
#
# Table name: scenes
#
#  id         :integer         not null, primary key
#  schematic  :text
#  created_at :datetime
#  updated_at :datetime
#  image      :string(255)
#

