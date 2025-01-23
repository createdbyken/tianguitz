# frozen_string_literal: true

module Mutations
  class Logout < BaseMutation
    field :success, Boolean, null: false

    def resolve
      token = context[:request].headers['Authorization']&.split('Bearer ')&.last

      if token
        Devise::JWT::RevocationStrategies::JTIMatcher.new.revoke_jwt(self, token)
      end

      { success: true }

    end
  end
end