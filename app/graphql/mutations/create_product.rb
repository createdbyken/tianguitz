# frozen_string_literal: true

module Mutations
  class CreateProduct < BaseMutation
    argument :product, Types::ProductInputType, required: true

    field :product, Types::ProductType, null: true
    field :errors, [String], null: false

    def resolve(product:)
      product = Product.new(product.to_h)

      if product.save
        { product: product, errors: [] }
      else
        { product: nil, errors: product.errors.full_messages }
      end
    end
  end
end