require 'rails_helper'

describe "User adds new member to project" do
  scenario "fills in info" do
    user = create(:user)
    user2 = create(:user)
    login(user)
    create_project
    fill_in "username", with: user2.username
    click_on "Add Member"

    expect(page).to have_content user2.username
  end
end
