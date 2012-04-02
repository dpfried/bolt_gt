# == Schema Information
#
# Table name: images
#
#  id         :integer         primary key
#  filename   :string(255)
#  schematic  :text
#  created_at :timestamp
#  updated_at :timestamp
#  image      :string(255)
#

class Image < ActiveRecord::Base
  attr_accessible :image
  mount_uploader :image, ImageUploader
end

