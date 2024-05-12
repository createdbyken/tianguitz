# frozen_string_literal: true

require 'rails_helper'
require 'byebug'

RSpec.describe Api::V1::ProductsController, type: :controller do

  describe "POST #create" do
    let(:user) { create(:user) }
    let(:food_stand) { create(:food_stand) }
    let(:product) { create(:product) }

    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: { product: {
            name: product.name,
            price: product.price,
            description: product.description,
            food_stand_id: food_stand.id
          } }
        }.to change(Product, :count).by(1)
      end

      it "renders a JSON response with the new product" do
        sign_in user
        post :create, params: { product: {
          name: product.name,
          price: product.price,
          description: product.description,
          food_stand_id: food_stand.id
        } }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "does not create a new Product" do
        sign_in user

        expect {
          post :create, params: { product: { name: nil, price: nil } }
        }.to change(Product, :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('errors')
      end
    end

  end
end