class Recipe < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :ingredients
end
