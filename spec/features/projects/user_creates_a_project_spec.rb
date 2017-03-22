require 'rails_helper'

describe "User creates a new project" do
  scenario "fills in all required info" do
    user = create(:user)
    login(user)
    fill_in "project_name", with: "project1"
    click_on "New Project"

    expect(page).to have_content "project1"

    #user is on current members list
    expect(page).to have_content user.username

    visit user_path(user.id)

    #project list contains project
    expect(page).to have_link "project1"
  end
end
