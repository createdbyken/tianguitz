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