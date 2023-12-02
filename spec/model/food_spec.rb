require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'name, measurment_unit, price, user should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(name: 'Apple', measurment_unit: 'grams', price: '10', user: user)
    expect(food).to be_valid
  end

  it 'name should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(measurment_unit: 'grams', price: '10', user: user)
    expect(food).to_not be_valid
  end

  it 'measurment_unit should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(name: 'Apple', price: '10', user: user)
    expect(food).to_not be_valid
  end

  it 'price should be present' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(name: 'Apple', measurment_unit: 'grams', user: user)
    expect(food).to_not be_valid
  end

  it 'price should be positive' do
    user = User.new(name: 'User', email: 'user@email', password: '753951')
    food = Food.new(name: 'Apple', measurment_unit: 'grams', price: '-10', user: user)
    expect(food).to_not be_valid
  end

  it 'user should be present' do
    food = Food.new(name: 'Apple', measurment_unit: 'grams', price: '10')
    expect(food).to_not be_valid
  end
end
