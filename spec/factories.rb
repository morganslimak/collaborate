FactoryGirl.define do
  factory :user do
    first_name "Morgan"
    last_name "S"
    username
    password "password"
  end
  sequence(:username) { |n| "user#{n}" }
end
