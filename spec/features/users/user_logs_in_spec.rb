require "rails_helper"

describe "User logs in" do
  scenario "redirects to dashboard" do
    user = create(:user)
    visit '/'
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_on "Login"

    expect(page).to have_content "Welcome back, Morgan!"
  end
end
