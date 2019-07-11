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

end
