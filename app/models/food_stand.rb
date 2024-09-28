# == Schema Information
#
# Table name: food_stands
#
#  id          :bigint           not null, primary key
#  address     :string           default("")
#  hours_close :string           default(""), not null
#  hours_open  :string           default(""), not null
#  is_open     :boolean          default(FALSE)
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
  include ImageAttachable
  before_create :generate_qr_code

  enum category: { food: 0, drink: 1, dessert: 2, snack: 3, healthy: 4}

  has_many :products

  belongs_to :user
  belongs_to :category
  validates :is_open, inclusion: { in: [true, false] }
  validates :name, :hours_open, :hours_close, :latitude, :longitude, presence: true

  def generate_qr_code
    qr_content = "food_stand_id=#{self.id}"

    qr_code = RQRCode::QRCode.new(qr_content)
    self.qr_code = Base64.encode64(qr_code.as_png(size: 300).to_s)
  end
end
