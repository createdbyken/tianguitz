# frozen_string_literal: true

module Mutations
  class SubscribeToFoodStand < BaseMutation
    argument :qr_code, String, required: true

    field :message, String, null: true
    field :food_stand, Types::FoodStandType, null: true

    def resolve(qr_code:)
      food_stand = FoodStand.find_by(qr_code: qr_code)

      return { message: "Food Stand not found", food_stand: nil } if food_stand.nil?

      subscription = FoodStandSubscription.find_or_create_by(
        user: context[:current_user],
        food_stand: food_stand
      )

      if subscription.persisted?
        { message: "Successfully subscribed", food_stand: food_stand }
      else
        { message: "Failed to subscribe", food_stand: nil }
      end
    end
  end
end
