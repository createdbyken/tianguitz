# frozen_string_literal: true

require 'rails_helper'

describe 'UpdateProduct', type: :request do
  let(:user) { create(:user) }
  let(:token) { JWT.encode({ sub: user.id }, Rails.application.secrets.secret_key_base) }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }
  let(:food_stand) { create(:food_stand, user: user) }
  let(:product) { create(:product, food_stand: food_stand) }

  let(:mutation_string) do
    <<~GQL
      mutation {
        updateProduct(
          input: {
            id: "#{product.id}"
            updateProduct: {
              name: "Updated Product Name"
              price: 50.0
              description: "Updated Product Description"
              available: false
              foodStandId: "#{food_stand.id}"
            }
          }
        ) {
          product {
            name
            price
            description
            available
          }
          errors
        }
      }
    GQL
  end

  it 'updates a product' do
    post '/graphql', params: { query: mutation_string }, headers: headers
    json = JSON.parse(response.body)
    data = json['data']['updateProduct']

    expect(data['product']['name']).to eq('Updated Product Name')
    expect(data['product']['price']).to eq(50)
    expect(data['product']['description']).to eq('Updated Product Description')
    expect(data['product']['available']).to eq(false)
    expect(data['errors']).to be_empty
  end

  it 'validates presence of price' do
    product = Product.new(name: "Test Product", price: nil)
    expect(product).not_to be_valid
    expect(product.errors[:price]).to include("can't be blank")
  end

  it 'returns an error when the update fails' do
    invalid_mutation = <<~GQL
      mutation {
        updateProduct(
          input: {
            id: "#{product.id}"
            updateProduct: {
              name: "Updated Product Name"
              price: -10.0
              description: "Updated Product Description"
              available: false
              foodStandId: "#{food_stand.id}"
            }
        }) {
          product {
            name
            price
            description
            available
          }
          errors
        }
      }
    GQL
  
    post '/graphql', params: { query: invalid_mutation }, headers: headers
    json = JSON.parse(response.body)
    data = json['data']['updateProduct']
  
    expect(data['product']).to be_nil
    expect(data['errors']).to include("Price must be greater than 0")
  end
  
end