# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    complete_name { "#{Faker::Name.name} #{Faker::Name.last_name}" }
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { Faker::PhoneNumber.cell_phone }
    password { '123456' }
  end
end
