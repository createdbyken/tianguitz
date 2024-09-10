# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_food_stands, mutation: Mutations::CreateFoodStands
    field :sign_up, mutation: Mutations::SignUp
    field :login, mutation: Mutations::Login
    field :create_product, mutation: Mutations::CreateProduct
  end
end
