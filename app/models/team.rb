class Team < ActiveRecord::Base
  belongs_to :user
  has_many :members
  has_many :team_sponsors
  has_many :sponsors, through: :team_sponsors
end
