class CreateFoodStandSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :food_stand_subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :food_stand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
