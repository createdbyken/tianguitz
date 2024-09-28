# frozen_string_literal: true

module Types
  class UpdateFoodStandInputType < Types::BaseInputObject
    description 'Attributes for updating a food stand'

    argument :id, ID, required: false
    argument :name, String, required: false
    argument :address, String, required: false
    argument :hours_open, String, required: false
    argument :hours_close, String, required: false
    argument :is_open, Boolean, required: false
    argument :latitude, Float, required: false
    argument :longitude, Float, required: false

    argument :category_id, ID, required: false
  end
end