# frozen_string_literal: true

FactoryBot.define do
  factory :food_stand do
    name { Faker::Restaurant.name }
    address { Faker::Address.full_address }
    hours_open { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).strftime("%H:%M") }
    hours_close { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1).strftime("%H:%M") }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    user_id { create(:user).id }
    category_id { create(:category).id }
  end
end