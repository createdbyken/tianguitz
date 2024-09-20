# frozen_string_literal: true

module Mutations
  class UpdateFoodStandStatus < BaseMutation
    argument :id, ID, required: true
    argument :is_open, Boolean, required: true

    field :food_stand, Types::FoodStandType, null: false

    def resolve(id:, is_open:)
      food_stand = FoodStand.find(id)
      if food_stand.update(is_open: is_open)

        GraphqlSchema.subscriptions.trigger(:food_stand_status_changed, { id: food_stand.id }, food_stand)
        { food_stand: food_stand }
      else
        raise GraphQL::ExecutionError, food_stand.errors.full_messages
      end
    end
  end
end