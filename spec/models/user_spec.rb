require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it "is valid with all fields" do
      user = User.new(first_name: "morgan", last_name: "s", username: "user",
                      password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end

    it "password confirmation works" do
      user = User.new(first_name: "morgan", last_name: "s", username: "user",
                      password: "password", password_confirmation: "pass")
      expect(user).to be_invalid
    end

    it "username must be unique" do
      user = User.create(first_name: "morgan", last_name: "s", username: "user",
                      password: "password", password_confirmation: "password")
      user2 = User.new(first_name: "morgan", last_name: "s", username: "user",
                      password: "password", password_confirmation: "password")
      expect(user2).to be_invalid
    end

    it "invalid without first_name" do
      user = User.new(last_name: "s", username: "user",
                      password: "password", password_confirmation: "password")
      expect(user).to be_invalid
    end

    it "invalid without last_name" do
      user = User.new(first_name: "morgan", username: "user",
                      password: "password", password_confirmation: "password")
      expect(user).to be_invalid
    end

    it "invalid without username" do
      user = User.new(first_name: "morgan", last_name: "s",
                      password: "password", password_confirmation: "password")
      expect(user).to be_invalid
    end
  end
end
