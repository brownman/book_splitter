class CreateBraves < ActiveRecord::Migration
  def self.up
    create_table :braves do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end

  def self.down
    drop_table :braves
  end
end
