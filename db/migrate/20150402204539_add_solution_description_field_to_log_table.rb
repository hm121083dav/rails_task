class AddSolutionDescriptionFieldToLogTable < ActiveRecord::Migration
  def up
    add_column :logs, :solution_description, :text
  end

  def down
    remove_column :logs, :solution_description
  end
end
