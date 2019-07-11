class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :round

  validates_associated :user, :round
end