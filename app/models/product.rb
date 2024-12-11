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
class Product < ApplicationRecord
  include ImageAttachable
  belongs_to :food_stand

  validates :name, :price, presence: true
  validates :description, presence: true, length: { maximum: 50 }
  validates :price, numericality: { greater_than: 0 }
end
