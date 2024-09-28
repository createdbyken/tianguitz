# frozen_string_literal: true

require 'rails_helper'

describe 'CreateFoodStand', type: :request do
  let(:user) { create(:user) }
  let(:token) { JWT.encode({ sub: user.id }, Rails.application.secrets.secret_key_base) }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }

  let(:mutation_string) do
    <<~GQL
      mutation {
        createFoodStands(
          input: {
            foodStand: {
              name: "Food Stand Name"
              address: "#{Faker::Address.full_address}"
              hoursOpen: "#{Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).strftime('%H:%M:%S')}"
              hoursClose: "#{Faker::Time.between(from: DateTime.now, to: DateTime.now + 1).strftime('%H:%M:%S')}"
              isOpen: true
              latitude: 1.5
              longitude: 1.5
              categoryId: "#{create(:category).id}"
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

  it 'creates a food stand' do
    post '/graphql', params: { query: mutation_string }, headers: headers
    json = JSON.parse(response.body)

    data = json['data']['createFoodStands']

    expect(data['foodStand']['name']).to eq('Food Stand Name')
    expect(data['foodStand']['address']).to be_present
    expect(data['foodStand']['hoursOpen']).to be_present
    expect(data['foodStand']['hoursClose']).to be_present
    expect(data['foodStand']['isOpen']).to eq(true)
    expect(data['errors']).to be_empty
  end

  # it 'returns an error if the food stand is invalid' do
  #   post '/graphql', params: { query: query.gsub('Food Stand Name', '') }
  #   json = JSON.parse(response.body)
  #   data = json['data']['createFoodStand']

  #   expect(data['foodStand']).to be_nil
  #   expect(data['errors']).to eq(["Name can't be blank"])
  # end
end