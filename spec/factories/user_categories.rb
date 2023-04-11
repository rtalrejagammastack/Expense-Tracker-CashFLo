FactoryBot.define do
  factory :user_category do
    name { Faker::Name.name }
    user { create(:user) }
  end
end