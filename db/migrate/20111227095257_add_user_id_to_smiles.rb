class AddUserIdToSmiles < ActiveRecord::Migration
  def self.up
    add_column :smiles, :user_id, :integer
  end

  def self.down
    remove_column :smiles, :user_id
  end
end
