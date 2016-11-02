require "rails_helper"

describe "User creates an account" do
  scenario "fills in all required info for new user" do
    visit new_user_path
    fill_in "user[first_name]", with: "Morgan"
    fill_in "user[last_name]", with: "S"
    fill_in "user[username]", with: "morgan_s"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Create Account"

    expect(page).to have_content "Welcome, Morgan"
  end
end
