require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context "with valid data" do
    it "should save the User" do
      expect(user).to be_valid
    end

    it "should start with 10.000 credits" do
      expect(user.credits).to eq(10000)
    end

    it "should receive Daily Bonus" do
      previous_credits = user.credits
      User.grant_daily_bonus
      expect( User.find(user.id).credits ).to eq( previous_credits + 10000 )
    end
  end

  context "with invalid data" do
    it "shouldn't save the user with empty Username" do
      @user2 = build(:user, username: nil)
      expect(@user2).to_not be_valid
    end

    it "shouldn't save the User with Username already taken" do
      @user2 = build(:user, username: user.username)
      expect(@user2).to_not be_valid
    end

    it "shouldn't save with negative credits" do
      @user2 = build(:user, credits: -10)
      expect(@user2).to_not be_valid
    end

    it "shouldn't save with a short Username" do
      @user2 = build(:user, username: 'a')
      expect(@user2).to_not be_valid
    end

    it "shouldn't save with a very long Username" do

      @user2 = build(:user, username: ('a' * 300) )
      expect(@user2).to_not be_valid
    end

  end

end
