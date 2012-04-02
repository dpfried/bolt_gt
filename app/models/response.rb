# == Schema Information
#
# Table name: responses
#
#  id                 :integer         primary key
#  answer             :text
#  user_id            :integer
#  annotation_task_id :integer
#  created_at         :timestamp
#  updated_at         :timestamp
#

class Response < ActiveRecord::Base
  validates :answer, :presence => true
  belongs_to :user
  belongs_to :annotation_task
end
