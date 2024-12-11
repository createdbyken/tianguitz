# frozen_string_literal: true

module Mutations
  class UpdateProduct < BaseMutation
    argument :id, ID, required: true
    argument :update_product, Types::ProductInputType, required: true
    
    field :product, Types::ProductType, null: true
    field :errors, [String], null: false
    
    def resolve(id:, update_product:)
      current_user = context[:current_user]
      product = current_user.food_stands.find_by(id: update_product[:food_stand_id]).products.find_by(id: id)
      
      if product.update(update_product.to_h)
        { product: product, errors: [] }
      else
        { product: nil, errors: product.errors.full_messages }
      end
    end
  end
end