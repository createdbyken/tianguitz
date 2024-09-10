# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :price, Float, null: false
    field :description, String, null: true
    field :category, Types::CategoryType, null: false
  end
end