require 'faker'
require 'factory_bot_rails'

::FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    role { 'patient' }
  end
end

FactoryBot.define do
  factory :doctor do
    user { association(:user, role: 'doctor') }
    description { Faker::Lorem.sentence }
    city { Faker::Address.city }
    specialty { Faker::Lorem.word }
    clinic_name { Faker::Company.name }
  end
end

FactoryBot.define do
  factory :patient do
    user { association(:user, role: 'patient') }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end