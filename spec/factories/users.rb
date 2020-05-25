FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    name { Faker::Name.first_name }
    password { 123_456 }
  end
end
