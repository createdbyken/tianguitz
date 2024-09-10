# frozen_string_literal: true

module Types
  class FoodStandType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :address, String, null: true
    field :hours_open, String, null: false
    field :hours_close, String, null: false
    field :qr_code, String, null: true
    field :latitude, Float, null: true
    field :longitude, Float, null: true
    
    field :user, Types::UserType, null: true
    field :category, Types::CategoryType, null: false
  end
end