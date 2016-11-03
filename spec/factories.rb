FactoryGirl.define do
  factory :task do
    description "MyString"
    project nil
  end
  factory :project do
    name "MyString"
    user nil
  end
  factory :user do
    first_name "Morgan"
    last_name "S"
    username
    password "password"
  end
  sequence(:username) { |n| "user#{n}" }
end
