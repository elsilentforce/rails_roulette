require "rails_helper"

RSpec.feature "Creating User:" do
  let (:test_user) { FactoryBot.build(:user) }

  scenario "Someone creates a new User" do
    visit "/"
    click_link "New User"

    fill_in "Username", with: test_user.username

    click_button "Create User"

    expect(page).to have_content("User was successfully created.")
    expect(page).to have_current_path( user_path(User.last) )
  end

end
