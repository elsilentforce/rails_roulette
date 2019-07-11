require "rails_helper"

RSpec.describe Round, type: :model do
  let(:round) { create(:round) }

  it "should create a round with valid params" do
    expect(round).to be_valid
  end

end
