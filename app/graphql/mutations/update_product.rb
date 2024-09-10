# frozen_string_literal: true

module Mutations
  class UpdateProduct < BaseMutation
    argument :product, Types::ProductInputType, required: true
    
    field :product, Types::ProductType, null: true
    field :errors, [String], null: false
    
    def resolve(product:)
      current_user = context[:current_user]
      
      product = Product.find(product[:id])
      product.assign_attributes(product.to_h)
      product.user_id = current_user.id
      
      if product.save
        { product: product, errors: [] }
      else
        { product: nil, errors: product.errors.full_messages }
      end
    end
  end
end