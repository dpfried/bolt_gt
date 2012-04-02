class AddSceneIdToResponse < ActiveRecord::Migration
  def self.up
    add_column :responses, :scene_id, :integer
  end

  def self.down
    remove_column :responses, :scene_id
  end
end
