class AddQuizableToAssemblers < ActiveRecord::Migration
  def self.up
 change_table :assemblers do |t|
      t.references :quizable, :polymorphic => true
    end
  end

  def self.down
 change_table :assemblers do |t|
      t.remove_references :quizable, :polymorphic => true
    end
  end
end
