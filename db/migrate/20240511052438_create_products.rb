class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.integer :price, null: false, default: 0
      t.boolean :available, null: false, default: true

      t.references :food_stand, null: false, foreign_key: true
      t.timestamps
    end
  end
end
