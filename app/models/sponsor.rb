class Sponsor < ActiveRecord::Base
  has_many :team_sponsors
  has_many :teams, through: :team_sponsors
end
