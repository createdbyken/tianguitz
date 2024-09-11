# frozen_string_literal: true

module Subscriptions
  class FoodStandStatusChanged < Subscriptions::BaseSubscription
    field :food_stand, Types::FoodStandType, null: false

    def subscribe(id:)
      food_stand = FoodStand.find(id)
      { food_stand: food_stand }
    end

    def update(food_stand:)
      { food_stand: food_stand }
    end
  end
end