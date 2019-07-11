class Bet < ActiveRecord::Base
  scope :by_round, -> (id){ where(round_id: id) }

  belongs_to :user
  belongs_to :round

  validates_associated :user, :round
  validates :ammount, presence: true
end
