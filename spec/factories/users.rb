FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    activated { true }
    password { "abc" }
    password_confirmation { "abc" }
  end
end
