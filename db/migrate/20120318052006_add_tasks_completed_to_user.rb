class AddTasksCompletedToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :tasks_completed, :integer, :default => 0
  end

  def self.down
    remove_column :users, :tasks_completed
  end
end
