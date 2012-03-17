class CreateAnnotationTasks < ActiveRecord::Migration
  def self.up
    create_table :annotation_tasks do |t|
      t.string :question

      t.timestamps
    end
  end

  def self.down
    drop_table :annotation_tasks
  end
end
