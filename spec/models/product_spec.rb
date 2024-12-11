# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  available     :boolean          default(TRUE), not null
#  description   :string           default(""), not null
#  name          :string           default(""), not null
#  price         :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  food_stand_id :bigint           not null
#
# Indexes
#
#  index_products_on_food_stand_id  (food_stand_id)
#
# Foreign Keys
#
#  fk_rails_...  (food_stand_id => food_stands.id)
#
require 'rails_helper'

RSpec.describe Product, type: :model do

  let!(:product) { create(:product) }
  describe 'associations' do
    it { should belong_to(:food_stand) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_most(50) }
  end
end
