# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    field :errors, [String], null: false
    field :success, Boolean, null: false


    protected

    def authorize_user
      raise GraphQL::ExecutionError, 'You need to authenticate to perform this action' unless context[:current_user]
    end

    def current_user
      context[:current_user]
    end
  end
end
