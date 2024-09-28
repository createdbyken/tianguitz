# frozen_string_literal: true

require 'rails_helper'

describe 'CreateProduct', type: :request do
  let(:user) { create(:user) }
  let(:food_stand) { create(:food_stand, user: user) }
  let(:query) do
    <<~GQL
      mutation {
        createProduct(
          input: {
            product: {
              name: "Product Name"
              price: 100
              description: "Product Description"
              available: true
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

  it 'creates a product' do
    post '/graphql', params: { query: query }
    json = JSON.parse(response.body)
    data = json['data']['createProduct']

    expect(data['product']['name']).to eq('Product Name')
    expect(data['product']['price']).to eq(100)
    expect(data['product']['description']).to eq('Product Description')
    expect(data['product']['available']).to eq(true)
    expect(data['errors']).to be_empty
  end

  it 'returns an error if the product is invalid' do
    post '/graphql', params: { query: query.gsub('Product Name', '') }
    json = JSON.parse(response.body)
    data = json['data']['createProduct']

    expect(data['product']).to be_nil
    expect(data['errors']).to eq(["Name can't be blank"])
  end
end