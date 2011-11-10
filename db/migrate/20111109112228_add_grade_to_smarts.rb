class AddGradeToSmarts < ActiveRecord::Migration
  def self.up
    add_column :smarts, :grade, :integer
  end

  def self.down
    remove_column :smarts, :grade
  end
end
