class CreateTeamSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :team_sponsors do |t|
      t.integer :team_id
      t.integer :sponsor_id
    end
  end
end
