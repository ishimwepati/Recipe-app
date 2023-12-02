class CreateShoppingLists < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_lists do |t|
      t.string :name
      t.decimal :quantity
      t.string :measurement_unit
      t.string :value
      t.references :ingredient, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
