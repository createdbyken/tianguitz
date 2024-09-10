# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :price, Float, null: false
    field :description, String, null: true
    field :available, Boolean, null: false
    field :food_stand, Types::FoodStandType, null: false
  end
end