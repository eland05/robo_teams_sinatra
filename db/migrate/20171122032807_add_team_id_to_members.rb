class AddTeamIdToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :team_id, :integer
  end
end
