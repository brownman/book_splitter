class AddMaybeToSmarts < ActiveRecord::Migration
  def self.up
    add_column :smarts, :maybe, :string
  end

  def self.down
    remove_column :smarts, :maybe
  end
end
