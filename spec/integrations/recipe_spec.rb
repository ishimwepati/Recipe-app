require 'rails_helper'

Capybara.default_max_wait_time = 10

RSpec.describe 'Recipes', type: :feature do
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
  end
end
