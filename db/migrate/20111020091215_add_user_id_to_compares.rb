class AddUserIdToCompares < ActiveRecord::Migration
  def self.up
    add_column :compares, :user_id, :integer
  end

  def self.down
    remove_column :compares, :user_id
  end
end
