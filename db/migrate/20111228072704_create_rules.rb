class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.string :name
      t.string :details
      t.text :examples
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rules
  end
end
