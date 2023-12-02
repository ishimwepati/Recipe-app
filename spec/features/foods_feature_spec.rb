# spec/features/foods_feature_spec.rb
require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'user creates a new food' do
    visit new_food_path

    fill_in 'Name', with: 'New Food'
    fill_in 'Measurement Unit', with: 'Unit'
    fill_in 'Price', with: 10.99

    click_button 'Add Food'

    expect(page).to have_text('New Food is added to the list!')
    expect(page).to have_text('New Food')
  end

  scenario 'user deletes a food' do
    food = create(:food, user: user)

    visit foods_path

    click_button 'Delete'

    expect(page).to have_text('Food successfully deleted.')
    expect(page).not_to have_text(food.name)
  end
end
