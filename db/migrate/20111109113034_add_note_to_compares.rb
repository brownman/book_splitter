class AddNoteToCompares < ActiveRecord::Migration
  def self.up
    add_column :compares, :note, :text
  end

  def self.down
    remove_column :compares, :note
  end
end
