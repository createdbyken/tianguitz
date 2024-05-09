# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  birth_date             :date             not null
#  complete_name          :string           default(""), not null
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  jti                    :string           not null
#  phone                  :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_jti                   (jti) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'test_helper'
require 'faker'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      complete_name: "#{Faker::Name.name} #{Faker::Name.last_name}",
      email: Faker::Internet.email,
      username: Faker::Internet.username,
      birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
      phone: Faker::PhoneNumber.cell_phone,
      password: '123456'
    )
    expect(user).to be_valid
  end
end
