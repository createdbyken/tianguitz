# == Schema Information
#
# Table name: food_stand_subscriptions
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  food_stand_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_food_stand_subscriptions_on_food_stand_id  (food_stand_id)
#  index_food_stand_subscriptions_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (food_stand_id => food_stands.id)
#  fk_rails_...  (user_id => users.id)
#
class FoodStandSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :food_stand

  validates :user_id, uniqueness: { scope: :food_stand_id, message: "You are already subscribed to this food stand" }
end
