require "rails_helper"

describe "User logs in" do
  scenario "redirects to dashboard" do
    user = create(:user)
    visit '/'
    fill_in "username", with: user.username
    fill_in "password", with: "password"
    click_on "Log In"

    expect(page).to have_content "Welcome, Morgan"
  end
end
