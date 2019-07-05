class Game < ActiveRecord::Base
  has_many :rounds
  has_many :users, through: :rounds

  after_create :create_round

  def create_round
    User.all.each do |user|
      Round.create(user_id: user.id, game_id: self.id, bet: 0).save
    end
  end

end
