require 'rails_helper'

describe "User adds a task to project" do
  scenario "fills in info" do
    user = create(:user)
    login(user)
    create_project
    fill_in "task_description", with: "Write some code"
    click_on "Add Task"

    expect(page).to have_content "Write some code"
  end
end
