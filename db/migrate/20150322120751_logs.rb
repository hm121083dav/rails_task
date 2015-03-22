class Logs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :ticket_id
      t.integer :status_id
      t.integer :assigned_id
      t.integer :committer_id

      t.timestamps null: false
    end
  end
end
