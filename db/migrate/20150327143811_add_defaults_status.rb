class AddDefaultsStatus < ActiveRecord::Migration
  def change
    Status.create(name: 'New')
    Status.create(name: 'Open')
    Status.create(name: 'Processing')
    Status.create(name: 'Closed')
  end
end

