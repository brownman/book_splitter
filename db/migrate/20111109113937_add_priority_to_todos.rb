class AddPriorityToTodos < ActiveRecord::Migration
  def self.up
    add_column :todos, :priority, :integer
  end

  def self.down
    remove_column :todos, :priority
  end
end
