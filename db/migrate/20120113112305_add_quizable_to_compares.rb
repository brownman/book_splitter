class AddQuizableToCompares < ActiveRecord::Migration
 
  def self.up
 change_table :compares do |t|
      t.references :quizable, :polymorphic => true
    end
  end

  def self.down
 change_table :compares do |t|
      t.remove_references :quizable, :polymorphic => true
    end
  end
end
