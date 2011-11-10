class AddDescriptionToSmarts < ActiveRecord::Migration
  def self.up
    add_column :smarts, :description, :string
  end

  def self.down
    remove_column :smarts, :description
  end
end
