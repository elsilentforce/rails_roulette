require "rails_helper"

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end

  context "with valid data" do
    it "should save the User" do
      expect(@user1).to be_valid
    end
  end

  context "with invalid data" do
    it "shouldn't save the user with empty Username" do
      @user2 = build(:user, username: nil)
      expect(@user2).to_not be_valid
    end

    it "shouldn't save the User with Username already taken" do
      @user2 = build(:user, username: @user1.username)
      expect(@user2).to_not be_valid
    end

  end

end
