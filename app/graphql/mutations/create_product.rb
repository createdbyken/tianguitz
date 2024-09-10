# frozen_string_literal: true

module Mutations
  class CreateProduct < BaseMutation
    argument :name, String, required: true
    argument :description, String, required: true
    argument :price, Float, required: true
    argument :category_id, ID, required: true

    field :product, Types::ProductType, null: true
    field :errors, [String], null: false

    def resolve(args)
      product = Product.new(args)
      if product.save
        { product: product, errors: [] }
      else
        { product: nil, errors: product.errors.full_messages }
      end
    end
  end
end