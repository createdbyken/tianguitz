# frozen_string_literal: true

require 'rails_helper'

describe 'UpdateFoodStand', type: :request do
  let(:user) { create(:user) }
  let(:token) { JWT.encode({ sub: user.id }, Rails.application.secrets.secret_key_base) }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }
  let(:food_stand) { create(:food_stand, user: user) }  # Existing food stand

  let(:mutation_string) do
    <<~GQL
      mutation {
        updateFoodStand(
          input: {
            id: "#{food_stand.id}"
            updateFoodStand: {
              name: "Updated Food Stand Name"
              address: "123 Updated Address"
              hoursOpen: "09:00:00"
              hoursClose: "18:00:00"
              isOpen: false
              latitude: 12.34
              longitude: 56.78
              categoryId: "#{food_stand.category_id}"
            }
          }
        ) {
          foodStand {
            name
            address
            hoursOpen
            hoursClose
            isOpen
            latitude
            longitude
          }
          errors
        }
      }
    GQL
  end

  it 'updates a food stand' do
    post '/graphql', params: { query: mutation_string }, headers: headers
    json = JSON.parse(response.body)

    data = json['data']['updateFoodStand']

    expect(data['foodStand']['name']).to eq('Updated Food Stand Name')
    expect(data['foodStand']['address']).to eq('123 Updated Address')
    expect(data['foodStand']['hoursOpen']).to eq('09:00:00')
    expect(data['foodStand']['hoursClose']).to eq('18:00:00')
    expect(data['foodStand']['isOpen']).to eq(false)
    expect(data['foodStand']['latitude']).to eq(12.34)
    expect(data['foodStand']['longitude']).to eq(56.78)
    expect(data['errors']).to be_empty
  end

  it 'returns an error if the food stand is invalid' do
    invalid_mutation = mutation_string.gsub('"Updated Food Stand Name"', '""')
    post '/graphql', params: { query: invalid_mutation }, headers: headers
    json = JSON.parse(response.body)

    data = json['data']['updateFoodStand']

    expect(data['foodStand']).to be_nil
    expect(data['errors']).to eq(["Name can't be blank"])
  end
end
