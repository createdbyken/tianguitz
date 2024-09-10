# frozen_string_literal: true

module Types
  class UserInputType < Types::BaseInputObject
    description 'Attributes for creating or updating a user'

    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :complete_name, String, required: true
    argument :phone, String, required: true
    argument :username, String, required: true
    argument :birth_date, String, required: true
    #argument :avatar, ApolloUploadServer::Upload, required: false
  end
end
