class AddParentIdToLines < ActiveRecord::Migration
  def self.up
    add_column :lines, :parent_id, :integer
  end

  def self.down
    remove_column :lines, :parent_id
  end
end
