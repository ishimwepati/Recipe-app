class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :measurement_unit, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
