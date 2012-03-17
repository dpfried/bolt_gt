require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

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

