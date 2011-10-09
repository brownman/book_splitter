class AddCompareIdToDrafts < ActiveRecord::Migration
  def self.up
    add_column :drafts, :compare_id, :integer
  end

  def self.down
    remove_column :drafts, :compare_id
  end
end
