# frozen_string_literal: true

module Types
  class UserInputType < Types::BaseInputObject
    description 'Attributes for creating or updating a user'

    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :phone_number, String, required: true
    argument :role, String, required: false
    argument :avatar, ApolloUploadServer::Upload, required: false
  end
end
