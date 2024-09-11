# frozen_string_literal: true

module Subscriptions
  class BaseSubscription < GraphQL::Schema::Subscription
    field_class Types::BaseField
    object_class Types::BaseObject
    argument_class Types::BaseArgument
  end
end