class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string :action
      t.string :target
      t.string :conclusion

      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end
