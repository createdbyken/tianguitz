# == Schema Information
#
# Table name: food_stands
#
#  id          :bigint           not null, primary key
#  address     :string           default("")
#  hours_close :string           default(""), not null
#  hours_open  :string           default(""), not null
#  latitude    :float
#  longitude   :float
#  name        :string           default(""), not null
#  qr_code     :string           default("")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  user_id     :bigint
#
# Indexes
#
#  index_food_stands_on_category_id  (category_id)
#  index_food_stands_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
class FoodStand < ApplicationRecord
  enum category: { food: 0, drink: 1, dessert: 2, snack: 3, healthy: 4}

  belongs_to :user
  belongs_to :category
end
