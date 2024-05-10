# == Schema Information
#
# Table name: food_stands
#
#  id          :bigint           not null, primary key
#  address     :string           default(""), not null
#  hours_close :string           default("")
#  hours_open  :string           default("")
#  latitude    :float            not null
#  longitude   :float            not null
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
require "test_helper"

class FoodStandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
