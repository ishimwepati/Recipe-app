class AddQuantityToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredients, :quantity, :integer
  end
end
