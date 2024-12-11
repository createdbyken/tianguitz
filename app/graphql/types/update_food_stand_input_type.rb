# frozen_string_literal: true

module Types
  class UpdateFoodStandInputType < Types::BaseInputObject
    description 'Attributes for updating a food stand'

    argument :id, ID, required: false
    argument :name, String, required: true
    argument :address, String, required: true
    argument :hours_open, String, required: true
    argument :hours_close, String, required: true
    argument :is_open, Boolean, required: true
    argument :latitude, Float, required: true
    argument :longitude, Float, required: true

    argument :category_id, ID, required: false
  end
end