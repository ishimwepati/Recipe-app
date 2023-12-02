class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurment_unit
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
