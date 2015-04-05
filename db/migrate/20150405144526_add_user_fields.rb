class AddUserFields < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :surname, :string
  end

  def down
    remove_column :users, :name
    remove_column :users, :surname
  end
end
