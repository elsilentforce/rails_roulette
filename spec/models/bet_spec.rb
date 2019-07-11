require "rails_helper"

RSpec.describe Bet, type: :model do
  let(:user) { create(:user) }
  let(:round) { create(:round) }
  let(:bet) { create(:bet, user_id: user.id, round_id: round.id) }

  it "with valid attributes should save the Match" do
    expect(round).to be_valid
  end

end
