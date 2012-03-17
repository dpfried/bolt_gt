class AnnotationTask < ActiveRecord::Base
  has_many :responses
end

# == Schema Information
#
# Table name: annotation_tasks
#
#  id         :integer         not null, primary key
#  question   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

