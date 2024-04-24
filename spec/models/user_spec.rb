# frozen_string_literal: true

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
