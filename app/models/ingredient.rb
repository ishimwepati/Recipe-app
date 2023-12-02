class Ingredient < ApplicationRecord
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :food
  belongs_to :recipe
end
