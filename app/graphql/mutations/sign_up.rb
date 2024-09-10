# frozen_string_literal: true

module Mutations
  class SignUp < BaseMutation
    argument :input, Types::UserInputType, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: false
    field :errors, [String], null: false
    
    def resolve(args)
      user = User.new(args)
      if user.save
        token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
          { user: user, token: token, errors: [] }
      else
          { user: nil, token: nil, errors: user.errors.full_messages }
      end
    end
  end
end
