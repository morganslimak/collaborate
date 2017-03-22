  def login(user)
    visit '/'
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_on "Login"
  end

  def create_project
    fill_in "project_name", with: "project1"
    click_on "New Project"
  end
