FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::Number.number(digits: 10) }
    password { "123456" }
    password_confirmation { "123456" }
    confirmed_at { Time.now }
  end
end
