# frozen_string_literal: true

class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :food_stand_id)
  end
end
