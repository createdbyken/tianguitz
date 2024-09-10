# frozen_string_literal: true

module Mutations
  class CreateFoodStands < BaseMutation
    argument :name, String, required: true
    argument :address, String, required: false
    argument :hours_open, String, required: true
    argument :hours_close, String, required: true

    field :food_stand, Types::FoodStandType, null: true
    field :errors, [String], null: false
    
    def resolve(args)
      food_stand = FoodStand.new(args)
      if food_stand.save
        { food_stand: food_stand, errors: [] }
      else
        { food_stand: nil, errors: food_stand.errors.full_messages }
      end
    end
  end
end
