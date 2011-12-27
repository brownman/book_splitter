class CreateSmiles < ActiveRecord::Migration
  def self.up
    create_table :smiles do |t|
      t.string :title
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :smiles
  end
end
