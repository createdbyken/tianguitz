class AddIsOpenToFoodStands < ActiveRecord::Migration[7.0]
  def change
    add_column :food_stands, :is_open, :boolean, default: false
  end
end
