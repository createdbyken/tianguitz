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
require 'rails_helper'
require 'faker'
RSpec.describe FoodStand, type: :model do

  describe FoodStand do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category) }

    it 'is valid with valid attributes' do
      food_stand = build(:food_stand)
      expect(food_stand).to be_valid
    end
  end
end
