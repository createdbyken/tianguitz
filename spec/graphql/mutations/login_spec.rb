# frozen_string_literal: true

require 'rails_helper'

describe 'Login', type: :request do
  let!(:user) { create(:user) }

  describe '#resolve' do

    it 'returns a user when successful' do
      query = <<~GQL
        mutation {
          login(input: {
            email: "#{user.email}",
            password: "#{user.password}"
          }) {
            user {
              email
              username
            }
            errors
          }
        }
      GQL

      post '/graphql', params: { query: query }
      json = JSON.parse(response.body)
      data = json['data']['login']

      expect(data['user']['email']).to eq(user.email)
      expect(data['user']['username']).to eq(user.username)
      expect(data['errors']).to be_empty
    end

    it 'returns an error when user email is not found' do
      query = <<~GQL
        mutation {
          login(input: {
            email: "unkown@user.com",
            password: "#{user.password}"
          }) {
            user {
              email
              username
            }
            errors
          }
        }
      GQL

      post '/graphql', params: { query: query }
      json = JSON.parse(response.body)
      data = json['data']['login']

      expect(data['user']).to be_nil
      expect(data['errors']).to eq(['Invalid email or password'])
    end

    it 'returns an error when user password is incorrect' do
      query = <<~GQL
        mutation {
          login(input: {
            email: "#{user.email}",
            password: "wrong_password"
          }) {
            user {
              email
              username
            }
            errors
          }
        }
      GQL

      post '/graphql', params: { query: query }
      json = JSON.parse(response.body)
      data = json['data']['login']

      expect(data['user']).to be_nil
      expect(data['errors']).to eq(['Invalid email or password'])
    end

    it 'returns an error when email is not provided' do
      query = <<~GQL
        mutation {
          login(input: {
            email: "",
            password: "#{user.password}"
          }) {
            user {
              email
              username
            }
            errors
          }
        }
      GQL

      post '/graphql', params: { query: query }
      json = JSON.parse(response.body)
      data = json['data']['login']

      expect(data['user']).to be_nil
      expect(data['errors']).to eq(['Invalid email or password'])
    end

    it 'returns an error when password is not provided' do
      query = <<~GQL
        mutation {
          login(input: {
            email: "#{user.email}",
            password: ""
          }) {
            user {
              email
              username
            }
            errors
          }
        }
      GQL

      post '/graphql', params: { query: query }
      json = JSON.parse(response.body)
      data = json['data']['login']

      expect(data['user']).to be_nil
      expect(data['errors']).to eq(['Invalid email or password'])
    end
  end
end