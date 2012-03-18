class AddSceneIdToAnnotationTask < ActiveRecord::Migration
  def self.up
    add_column :annotation_tasks, :scene_id, :integer
  end

  def self.down
    remove_column :annotation_tasks, :scene_id
  end
end
