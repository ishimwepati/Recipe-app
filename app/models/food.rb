class Food < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :measurment_unit, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :ingredients

  def update_quantity
    total_quantity = ingredients.sum(&:quantity)
    update(quantity: total_quantity)
  end
end
