class DeleteAnnotationTaskResponseRelationship < ActiveRecord::Migration
  def self.up
    remove_column :responses, :annotation_task_id
    remove_column :annotation_tasks, :scene_id
    add_column :scenes, :sequence_id, :integer
  end

  def self.down
    remove_column :scenes, :sequence_id
    add_column :annotation_tasks, :scene_id, :integer
    add_column :responses, :annotation_task_id, :integer
  end
end
