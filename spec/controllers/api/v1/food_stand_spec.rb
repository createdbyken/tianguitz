# frozen_string_literal: true

require 'rails_helper'
require 'byebug'

RSpec.describe Api::V1::FoodStandsController, type: :controller do
  describe "POST #create" do
    
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:food_stand) { create(:food_stand) }

    context "with valid params" do
      it "creates a new FoodStand" do
        expect {
          post :create, params: { food_stand: { 
           name: food_stand.name,
           address: food_stand.address,
           hours_open: food_stand.hours_open,
           hours_close: food_stand.hours_close,
           latitude: food_stand.latitude,
           longitude: food_stand.longitude,
           user_id: user.id,
           category_id: category.id } } 
        }.to change(FoodStand, :count).by(1)
      end

      it "renders a JSON response with the new food_stand" do
        sign_in user
        
        post :create, params: { food_stand: { 
         name: food_stand.name,
         address: food_stand.address,
         hours_open: food_stand.hours_open,
         hours_close: food_stand.hours_close,
         latitude: food_stand.latitude,
         longitude: food_stand.longitude,
         user_id: user.id,
         category_id: category.id } }
        
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "does not create a new FoodStand" do
        sign_in user
        
        expect {
          post :create, params: { food_stand: { name: nil, address: nil } }
        }.to change(FoodStand, :count).by(0)
    
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('errors')
      end
    end

  end
end
