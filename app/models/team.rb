class Team < ActiveRecord::Base
  belongs_to :user
  has_many :members
  has_many :team_sponsors
  has_many :sponsors, through: :team_sponsors

  def new_members=(new_members)
    new_members.each do |member_attributes|
      if member_attributes[:name] != ""
        self.members.create(member_attributes)
      end
    end
  end

  def new_sponsor=(new_sponsor)
    if new_sponsor[:name] != ""
      self.sponsors << Sponsor.find_or_create_by(name: new_sponsor[:name])
    end
  end

end
