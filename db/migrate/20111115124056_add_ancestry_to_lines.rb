class AddAncestryToLines < ActiveRecord::Migration
  def self.up
    add_column :lines, :ancestry, :string
  end

  def self.down
    remove_column :lines, :ancestry
  end
end
