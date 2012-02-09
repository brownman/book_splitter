class AddChapterToAssemblers < ActiveRecord::Migration
  def self.up
    add_column :assemblers, :chapter, :string
  end

  def self.down
    remove_column :assemblers, :chapter
  end
end
