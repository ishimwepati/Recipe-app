class AddFoodRefToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_reference :ingredients, :food, null: false, foreign_key: true
  end
end
