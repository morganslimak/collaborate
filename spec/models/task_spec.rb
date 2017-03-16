require 'rails_helper'

RSpec.describe Task, type: :model do
  context "validations" do
    it "is valid with a description and belonging to project" do
      task = Project.new.tasks.new(description: "write some code")
      expect(task).to be_valid
    end

    it "invalid without a description" do
      task = Project.new.tasks.new
      expect(task).to be_invalid
    end

    it "invalid without project" do
      task = Task.new(description: "write some code")
      expect(task).to be_invalid
    end
  end
end
