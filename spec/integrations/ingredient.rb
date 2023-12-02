require 'rails_helper'

RSpec.describe 'Ingredients', type: :feature do
  user = User.create(name: 'User One', email: 'userone@example.com', password: '111111')
  before(:all) do
    visit new_user_registration_path
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'
    sleep 1
  end

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    sleep 1
    visit foods_path
    click_link 'Add Food'
    fill_in 'Name', with: 'Apple'
    fill_in 'Measurment unit', with: 'grams'
    fill_in 'Price', with: '10'
    click_button 'Add Food'
    visit recipes_path
    click_link 'Add Recipe'
    fill_in 'Name', with: 'Pie'
    fill_in 'Prepration time', with: '1'
    fill_in 'Cooking time', with: '0.5'
    fill_in 'Description', with: 'Apple pie is often served with whipped cream, ice cream, custard or cheddar cheese.'
    click_button 'Add Recipe'
    sleep 1
  end

  scenario 'Create/Edit/Delete an Ingredient' do
    click_link 'Pie'
    click_link 'Add ingredient'
    fill_in 'ingredient[quantity]', with: '20'
    click_button 'Add'
    assert_text 'Ingredient created!', count: 1
    visit recipes_path
    click_link 'Pie'
    assert_text 'Apple', count: 1
    assert_text '20 grams', count: 1
    assert_text '$ 200.0', count: 1
    click_link 'Modify'
    fill_in 'ingredient[quantity]', with: '10'
    click_button 'Modify'
    assert_text '10 grams', count: 1
    assert_text '$ 100.0', count: 1
    click_button 'Remove'
    assert_no_text 'Apple'
    sleep 1
  end
end
