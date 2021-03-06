class User < ActiveRecord::Base
  include SharedMethods
  scope :available_to_bet, -> { where('credits > 0') }

  has_many :bets
  has_many :rounds, through: :bets

  validates :username, presence: true,  length: { in: 3..255 }, uniqueness: true
  validates :credits, numericality: { greater_than_or_equal_to: 0 }

  # Sets current bet according to weather
  def set_current_bet
    rain_flag = OpenWeatherMapServices.new(city: "Santiago,cl").will_rain_next_week?

    return self.credits if self.credits < 1000   # Current user is all in if credits are lesser than 1000

    if rain_flag
      return ( self.credits * rand(0.04..0.1) ).round
    else
      return ( self.credits * rand(0.08..0.15) ).round
    end
  end

  def bet_on_round id
    bets.where("round_id=#{id}").first
  end

  def self.grant_daily_bonus
    self.transaction do
      all.each do |user|
        user.update(credits: (user.credits + 10000) )
      end
    end
  end


end
