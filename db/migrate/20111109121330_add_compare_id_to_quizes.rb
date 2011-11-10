class AddCompareIdToQuizes < ActiveRecord::Migration
  def self.up
    add_column :quizes, :compare_id, :integer
  end

  def self.down
    remove_column :quizes, :compare_id
  end
end
