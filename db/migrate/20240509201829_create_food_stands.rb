class CreateFoodStands < ActiveRecord::Migration[7.0]
  def change
    create_table :food_stands do |t|
      t.string :name, null: false, default: ''
      t.string :address, null: false, default: ''
      t.string :hours_open, null: true, default: ''
      t.string :hours_close, null: true, default: ''
      t.string :qr_code, null: true, default: ''
      t.float :latitude, null: false, default: ''
      t.float :longitude, null: false, default: ''
      t.references :user, null: true, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
