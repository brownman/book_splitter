class CreateLines < ActiveRecord::Migration
  def self.up
    create_table :lines do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lines
  end
end
