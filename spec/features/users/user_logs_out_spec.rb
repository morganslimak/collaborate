require "rails_helper"

describe "User logs out" do
  scenario "redirects to root" do
    user = create(:user)
    visit '/'
    fill_in "username", with: user.username
    fill_in "password", with: "password"
    click_on "Log In"

    click_link "Log Out"

    expect(current_path).to eq(root_path)
  end
end
