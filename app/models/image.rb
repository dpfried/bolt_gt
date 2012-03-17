class Image < ActiveRecord::Base
  attr_accessible :image
  mount_uploader :image, ImageUploader
end

# == Schema Information
#
# Table name: images
#
#  id         :integer         not null, primary key
#  filename   :string(255)
#  schematic  :text
#  created_at :datetime
#  updated_at :datetime
#  image      :string(255)
#

