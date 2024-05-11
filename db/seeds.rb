# frozen_string_literal: true
require "faker"

user = User.create( email: Faker::Internet.email,
                    username: Faker::Internet.username,
                    complete_name: "#{Faker::Name.name} #{Faker::Name.last_name}",
                    birth_date: Faker::Date.birthday(min_age: 18,
                    max_age: 65),
                    phone: Faker::PhoneNumber.cell_phone,
                    password: "12345678" )
user.save!

category = Category.create( name: Faker::Restaurant.type )
category.save!

food_stand = FoodStand.create( name: Faker::Restaurant.name,
                               address: Faker::Address.full_address,
                               hours_open: Faker::Time.between(from: DateTime.now - 1,to: DateTime.now).strftime("%H:%M"),
                               hours_close: Faker::Time.between(from: DateTime.now,to: DateTime.now + 1).strftime("%H:%M"),
                               latitude: Faker::Address.latitude,
                               longitude: Faker::Address.longitude,
                               user_id: user.id,
                               category_id: Category.first.id )
food_stand.save!