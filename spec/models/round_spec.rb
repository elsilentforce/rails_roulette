require "rails_helper"

RSpec.describe Round, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:game) { create(:game) }
  let(:bet) { rand(1..10000) }
  let(:round) { create(:round, user_id: user1.id, game_id: game.id, bet: bet) }

  it "with valid attributes should save the Match" do
    expect(round).to be_valid
  end

  it "shouldn't save without a valid User reference" do
    @test_round = build(:round, user_id: nil)
    expect(@test_round).to_not be_valid
  end

  it "shouldn't save with an invalid User reference" do
    expect {
      create(:round, user_id: 'user_id', game_id: game.id, bet: bet)
    }.to raise_error(ActiveRecord::InvalidForeignKey)
  end

  it "shuldn't save with an invalid Game reference" do
    expect{
      create(:round, user_id: user1.id, game_id: 'game_id', bet: bet)
    }.to raise_error(ActiveRecord::InvalidForeignKey)
  end

  it "shouldn't save if there is no Bet" do
    @test_round = build(:round, user_id: user1.id, game_id: game.id, bet: nil)
    expect(@test_round).not_to be_valid
  end

end
