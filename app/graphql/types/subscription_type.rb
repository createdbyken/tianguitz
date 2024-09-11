# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    field :food_stand_status_changed, subscription: Subscriptions::FoodStandStatusChanged
  end
end