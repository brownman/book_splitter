class CreateHunters < ActiveRecord::Migration
  def self.up
    create_table :hunters do |t|
      t.string :regexp
      t.integer :user_id
      t.text :result

      t.timestamps
    end
  end

  def self.down
    drop_table :hunters
  end
end
