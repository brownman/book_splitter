class AddUserIdToSmarts < ActiveRecord::Migration
  def self.up
    add_column :smarts, :user_id, :integer
  end

  def self.down
    remove_column :smarts, :user_id
  end
end
