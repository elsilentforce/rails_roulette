require "rails_helper"

RSpec.describe Match, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:game) { create(:game) }
  let(:bet) { rand(1..10000) }
  let(:match) { create(:match, user_id: user1.id, game_id: game.id, bet: bet) }

  it "with valid attributes should save the Match" do
    expect(match).to be_valid
  end

  it "shouldn't save without a valid User reference" do
    @test_match = build(:match, user_id: nil)
    expect(@test_match).to_not be_valid
  end

  it "shouldn't save with an invalid User reference" do
    expect {
      create(:match, user_id: 'user_id', game_id: game.id, bet: bet)
    }.to raise_error(ActiveRecord::InvalidForeignKey)
  end

  it "shuldn't save with an invalid Game reference" do
    expect{
      create(:match, user_id: user1.id, game_id: 'game_id', bet: bet)
    }.to raise_error(ActiveRecord::InvalidForeignKey)
  end

  it "shouldn't save if there is no Bet" do
    @test_match = build(:match, user_id: user1.id, game_id: game.id, bet: nil)
    expect(@test_match).not_to be_valid
  end

end
