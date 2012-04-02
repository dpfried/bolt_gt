# == Schema Information
#
# Table name: scenes
#
#  id         :integer         primary key
#  schematic  :text
#  created_at :timestamp
#  updated_at :timestamp
#  image      :string(255)
#

class Scene < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :annotation_tasks, :dependent => :destroy
  accepts_nested_attributes_for :annotation_tasks, :reject_if => lambda { |a| a[:question].blank? }, :allow_destroy => true
end
