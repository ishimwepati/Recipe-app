require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it 'quantity, food, recipe should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    recipe = Recipe.new(name: 'Bread', preparation_time: '5', cooking_time: '1', user: user)
    food = Food.new(name: 'Apple', measurment_unit: 'grams', price: '10', user: user)
    ingredient = Ingredient.new(quantity: '20', food: food, recipe: recipe)
    expect(ingredient).to be_valid
  end

  it 'quantity should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    recipe = Recipe.new(name: 'Bread', preparation_time: '1.5', cooking_time: '1', user: user)
    food = Food.new(name: 'Apple', measurment_unit: 'grams', price: '10', user: user)
    ingredient = Ingredient.new(food: food, recipe: recipe)
    expect(ingredient).to_not be_valid
  end

  it 'quantity should be positive' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    recipe = Recipe.new(name: 'Bread', preparation_time: '1.5', cooking_time: '1', user: user)
    food = Food.new(name: 'Apple', measurment_unit: 'grams', price: '10', user: user)
    ingredient = Ingredient.new(quantity: '-20', food: food, recipe: recipe)
    expect(ingredient).to_not be_valid
  end

  it 'food should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    recipe = Recipe.new(name: 'Bread', preparation_time: '1.5', cooking_time: '1', user: user)
    ingredient = Ingredient.new(quantity: '20', recipe: recipe)
    expect(ingredient).to_not be_valid
  end

  it 'recipe should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(name: 'Apple', measurment_unit: 'grams', price: '10', user: user)
    ingredient = Ingredient.new(quantity: '20', food: food)
    expect(ingredient).to_not be_valid
  end
end
