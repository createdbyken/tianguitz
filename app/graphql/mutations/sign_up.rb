# frozen_string_literal: true

module Mutations
  class SignUp < BaseMutation
    argument :user, Types::UserInputType, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: false
    field :errors, [String], null: false
    
    def resolve(user:)
      user = User.new(user.to_h)
      if user.save
        token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
          { user: user, token: token, errors: [] }
      else
          { user: nil, token: nil, errors: user.errors.full_messages }
      end
    end
  end
end
