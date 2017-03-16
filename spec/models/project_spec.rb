require 'rails_helper'

RSpec.describe Project, type: :model do
  context "validations" do
    it "is valid with a name" do
      project = Project.new(name: "Project1")
      expect(project).to be_valid
    end

    it "invalid without a name" do
      project = Project.new
      expect(project).to be_invalid
    end
  end
end
