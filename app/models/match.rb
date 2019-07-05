class Match < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  validates_presence_of :user_id, :game_id, :bet
  validates_associated :user, :game
end
