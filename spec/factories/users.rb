FactoryBot.define do
  factory :user do
    password = "test1234"

    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.email }
    password              { password }
    password_confirmation { password }
  end
end
