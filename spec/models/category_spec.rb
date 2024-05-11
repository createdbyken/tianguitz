require 'rails_helper'

RSpec.describe Category, type: :model do
  describe Category do
    it { is_expected.to have_many(:food_stands) }

    it 'is valid with valid attributes' do
      category = build(:category)
      expect(category).to be_valid
    end
  end
end
