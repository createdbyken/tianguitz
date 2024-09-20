# frozen_string_literal: true

module Mutations
  class UpdateFoodStand < BaseMutation
    argument :id, ID, required: true
    argument :update_food_stand, Types::UpdateFoodStandInputType, required: true

    field :food_stand, Types::FoodStandType, null: true
    field :errors, [String], null: false

    def resolve(id:, update_food_stand:)
      food_stand = FoodStand.find(id)

      if food_stand.update(update_food_stand.to_h)
        { food_stand: food_stand, errors: [] }
      else
        { food_stand: nil, errors: food_stand.errors.full_messages }
      end
    end
  end
end