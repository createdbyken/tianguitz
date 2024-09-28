# frozen_string_literal: true

require 'rails_helper'

describe 'SignUp', type: :request do
  let(:mutation_string) do
    <<~GQL
      mutation {
        signUp(input: {
          user: {
            completeName: "#{Faker::Name.name} #{Faker::Name.last_name}"
            email: "sample@user.com"
            username: "#{Faker::Internet.username}"
            birthDate: "#{Faker::Date.birthday(min_age: 18, max_age: 65)}"
            phone: "#{Faker::PhoneNumber.cell_phone}"
            password: "123456"
            passwordConfirmation: "123456"
          }
        }) {
          user {
            completeName
            email
            username
            birthDate
            phone
          }
          errors
        }
      }
    GQL
  end

  it 'creates a user' do
    post '/graphql', params: { query: mutation_string }
    json = JSON.parse(response.body)
    data = json['data']['signUp']

    expect(data['user']['completeName']).not_to be_empty
    expect(data['user']['email']).not_to be_empty
    expect(data['user']['username']).not_to be_empty
    expect(data['user']['birthDate']).not_to be_empty
    expect(data['user']['phone']).not_to be_empty
    expect(data['errors']).to be_empty
  end

  it 'returns an error when user email is already taken' do
    create(:user, email: 'sample@user.com')

    post '/graphql', params: { query: mutation_string }
    json_response = JSON.parse(response.body)
    expect(json_response['data']['signUp']['errors'].first).to eq('Email has already been taken')
  end
end