class AddDefaultsTeams < ActiveRecord::Migration
  def change
    Team.create(name: 'DataBase Team', short_name: 'DB')
    Team.create(name: 'Developer Team', short_name: 'DEV')
    Team.create(name: 'OPS Team', short_name: 'OPS')
    Team.create(name: 'Marketing Team', short_name: 'MARK')
    Team.create(name: 'Support team', short_name: 'SS')
  end
end
