# == Schema Information
#
# Table name: annotation_tasks
#
#  id         :integer         not null, primary key
#  question   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  scene_id   :integer
#

class AnnotationTask < ActiveRecord::Base
  belongs_to :scene
  has_many :responses, :dependent => :destroy
end
