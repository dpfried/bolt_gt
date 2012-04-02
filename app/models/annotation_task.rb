class AnnotationTask < ActiveRecord::Base

  def self.get_needy_annotation_task(user)
    # return the most needy annotation task that hasn't been completed by the user
    tasks = AnnotationTask.all.sort {|a,b| a.responses.length <=> b.responses.length }
    uncompleted = tasks.select do |task|
      not task.responses.find {|response| response.user == user}
    end
    return uncompleted[0] if not uncompleted.empty?
  end

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

