class CreateFoodStands < ActiveRecord::Migration[7.0]
  def change
    create_table :food_stands do |t|
      t.string :name, null: false, default: ''
      t.string :address, null: true, default: ''
      t.string :hours_open, null: false, default: ''
      t.string :hours_close, null: false, default: ''
      t.string :qr_code, null: true, default: ''
      t.float :latitude, null: true, default: ''
      t.float :longitude, null: true, default: ''
      t.references :user, null: true, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
