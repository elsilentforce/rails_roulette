class RoundsController < ApplicationController

  def new

  end

  def create
    User.each do |user|
      current_bet = set_current_bet(user)
      Round.create(user_id: user.id, game_id: game.id, bet: current_bet)
      user.update(credits: (user.credits - current_bet) )
    end
  end

  private
  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_current_bet user
    local_weather = OpenWeatherMapServices.new(city: "Santiago,cl")
    rain_flag = local_weather.will_rain_next_week?
    # Current user is all in if credits are lesser than 1000
    return user.credits if user.credits < 1000
    # User Bets
    if rain_flag
      # Users bets less in rainy conditions
      return ( user.credits * rand(0.04..0.1) ).round
    else
      return ( user.credits * rand(0.08..0.15) ).round
    end
  end

end
