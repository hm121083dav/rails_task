class Teams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :title
      t.string :short_title
    end
  end
end
