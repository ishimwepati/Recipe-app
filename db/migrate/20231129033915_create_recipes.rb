class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name ,null: false
      t.integer :preparation_time, null: false, default: 0
      t.integer :cooking_time, null: false, default: 0
      t.text :description, null: false
      t.boolean :public
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end