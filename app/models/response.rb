class Response < ActiveRecord::Base
  validates :answer, :presence => true
  belongs_to :user
  belongs_to :scene
end


# == Schema Information
#
# Table name: responses
#
#  id         :integer         not null, primary key
#  answer     :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

