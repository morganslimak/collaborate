require "rails_helper"

describe "User logs out" do
  scenario "redirects to root" do
    user = create(:user)
    visit '/'
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_on "Login"
    click_on "Log Out"

    expect(current_path).to eq(root_path)
  end
end
