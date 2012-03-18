# == Schema Information
#
# Table name: responses
#
#  id                 :integer         not null, primary key
#  answer             :text
#  user_id            :integer
#  annotation_task_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :annotation_task
end
