class Status < ActiveRecord::Migration
  def change
    create_table :status do |t|
      t.string :title
    end
  end
end
