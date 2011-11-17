class CreateSmarts < ActiveRecord::Migration
  def self.up
    create_table :smarts do |t|
      t.text :question
      t.string :answer

      t.timestamps
    end
  end

  def self.down
    drop_table :smarts
  end
end
