# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :complete_name, String, null: false
    field :email, String, null: false
    field :username, String, null: false
    field :phone, String, null: false
    field :birth_date, GraphQL::Types::ISO8601Date, null: false
    field :profile_picture, String, null: true
    field :food_stands, [Types::FoodStandType], null: true
  end
end