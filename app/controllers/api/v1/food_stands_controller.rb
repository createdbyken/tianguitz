# frozen_string_literal: true

class Api::V1::FoodStandsController < ApplicationController
  before_action :authenticate_user!


  def create
    @food_stand = FoodStand.new(food_stand_params)
    @food_stand.user = current_user
    if @food_stand.save
      render json: @food_stand
    else
      render json: { errors: @food_stand.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

  def food_stand_params
    params.require(:food_stand).permit(:name, :address, :hours_open, :hours_close, :latitude, :longitude, :user_id, :category_id)
  end

end
