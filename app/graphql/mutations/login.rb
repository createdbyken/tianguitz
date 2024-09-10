# frozen_string_literal: true

module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    
    field :user, Types::UserType, null: true
    field :token, String, null: true
    field :errors, [String], null: false

    def resolve(email:, password:)
      user = User.find_for_authentication(email: email)
      
      if user.nil? || !user.valid_password?(password)
        return { user: nil, token: nil, errors: ["Invalid email or password"] }
      end

      token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first

      { user: user, token: token, errors: [] }
    end
  end
end
