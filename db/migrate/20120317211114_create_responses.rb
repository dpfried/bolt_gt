class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.text :answer
      t.integer :user_id
      t.integer :annotation_task_id

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
