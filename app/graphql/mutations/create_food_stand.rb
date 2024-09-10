# frozen_string_literal: true

module Mutations
  class CreateFoodStand < BaseMutation
    argument :food_stand, Types::FoodStandInputType, required: true
    
    field :food_stand, Types::FoodStandType, null: true
    field :errors, [String], null: false
    
    def resolve(food_stand:)

      current_user = context[:current_user]
      food_stand = FoodStand.new(food_stand.to_h)
      food_stand.user_id = current_user.id

      if food_stand.save
        { food_stand: food_stand, errors: [] }
      else
        { food_stand: nil, errors: food_stand.errors.full_messages }
      end
    end
  end
end
