# frozen_string_literal: true

module Types
  class ProductInputType < Types::BaseInputObject
    description 'Attributes for creating or updating a product'

    argument :name, String, required: true
    argument :description, String, required: true
    argument :price, Float, required: true
    argument :available, Boolean, required: true
    argument :food_stand_id, ID, required: true
    #argument :image, ApolloUploadServer::Upload, required: false
  end
end