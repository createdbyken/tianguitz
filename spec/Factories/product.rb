# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { Faker::Number.decimal(l_digits: 2) }
    available { Faker::Boolean.boolean }
    food_stand_id { create(:food_stand).id }
  end
end