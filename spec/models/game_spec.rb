require "rails_helper"

RSpec.describe Game, type: :model do
  let(:game) { create(:game) }

  it "should create a game with valid params" do
    expect(game).to be_valid
  end

  it "should create a Round everytime a game is created" do
    @round = Round.find_by_game_id(game.id)
    expect(@round).to_not be_nil
  end
end
