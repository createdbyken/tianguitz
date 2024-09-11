# frozen_string_literal: true

module Mutations
  class DeleteFoodStand < BaseMutation
    argument :id, ID, required: true
    
    field :food_stand, Types::FoodStandType, null: true

    def resolve(id:)

      current_user = context[:current_user]
      food_stand = FoodStand.find(id)

      if food_stand.user_id == current_user.id
        food_stand.destroy
        { food_stand: food_stand }
      else
        raise GraphQL::ExecutionError, "You do not have permission to delete this food stand"
      end
    end
  end
end
