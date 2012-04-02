class Scene < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :responses, :dependent => :destroy
  belongs_to :sequence
end


# == Schema Information
#
# Table name: scenes
#
#  id          :integer         not null, primary key
#  schematic   :text
#  created_at  :datetime
#  updated_at  :datetime
#  image       :string(255)
#  sequence_id :integer
#

