class CreateTicketsTable < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :customer_name
      t.string :customer_email
      t.integer :team_id
      t.string :subject
      t.string :description
      t.integer :status_id
      t.integer :user_id
      t.string :ticket_name

      t.timestamps null: false
    end
  end
end
