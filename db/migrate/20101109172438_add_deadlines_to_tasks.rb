class AddDeadlinesToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :deadline, :date
  end

  def self.down
    remove_column :tasks, :deadline
  end
end
