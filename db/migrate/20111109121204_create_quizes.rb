class CreateQuizes < ActiveRecord::Migration
  def self.up
    create_table :quizes do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end

  def self.down
    drop_table :quizes
  end
end
