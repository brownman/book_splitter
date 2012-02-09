class AddQuizableToQuizes < ActiveRecord::Migration
  def self.up
    add_column :quizes, :quizable_id, :integer
    add_column :quizes, :quizable_type, :string
  end

  def self.down
    remove_column :quizes, :quizable_type
    remove_column :quizes, :quizable_id
  end
end
