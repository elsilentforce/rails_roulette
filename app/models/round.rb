class Round < ActiveRecord::Base
  include SharedMethods

  has_many :bets
  has_many :users, through: :bets

  def self.play

    self.transaction do
      winner_color = self.set_color # Roulette result
      user_bet_color = User.set_color # User bet
      match_multiplier = set_multiplier(winner_color)
      round = Round.create(winner: winner_color)

      User.available_to_bet.each do |user|
        current_bet = user.set_current_bet # Saves the current bet in memory (WARNING: It's a Random generated number, use this var instead method)
        #p "Player: #{ user.username } has #{ user.credits } this match and bets: #{ current_bet }"
        user.update(credits: (user.credits - current_bet) )
        #p "Now Player: #{ user.username } has: #{ user.credits } credits."
        bet = Bet.create(round_id: round.id, user_id: user.id, ammount: current_bet, target: user_bet_color)


        # Updates with bonus if gets the same result as Roulette
        if user_bet_color.eql? winner_color
          user_prize = current_bet * match_multiplier
          user.update( credits: ( user.credits + user_prize ) )
          #p "Player: #{ user.username } won #{current_bet * match_multiplier} credits for setting a bet on #{ winner_color }, its new balance is: #{ user.credits }."
        end

        bet.save
      end

    end

  end

  def self.set_multiplier color
    color = "Green" ? 15 : 2
  end


end
