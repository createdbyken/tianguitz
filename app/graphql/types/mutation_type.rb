# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :login, mutation: Mutations::Login
    field :create_product, mutation: Mutations::CreateProduct
    field :update_product, mutation: Mutations::UpdateProduct
    field :create_food_stands, mutation: Mutations::CreateFoodStand
    field :update_food_stand, mutation: Mutations::UpdateFoodStand
  end
end
