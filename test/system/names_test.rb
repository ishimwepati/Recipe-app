require 'application_system_test_case'

class NamesTest < ApplicationSystemTestCase
  setup do
    @name = names(:one)
  end

  test 'visiting the index' do
    visit names_url
    assert_selector 'h1', text: 'Names'
  end

  test 'should create name' do
    visit names_url
    click_on 'New name'

    fill_in 'Measurement unit', with: @name.measurement_unit
    fill_in 'Price', with: @name.price
    fill_in 'Quantity', with: @name.quantity
    fill_in 'User', with: @name.user_id
    click_on 'Create Name'

    assert_text 'Name was successfully created'
    click_on 'Back'
  end

  test 'should update Name' do
    visit name_url(@name)
    click_on 'Edit this name', match: :first

    fill_in 'Measurement unit', with: @name.measurement_unit
    fill_in 'Price', with: @name.price
    fill_in 'Quantity', with: @name.quantity
    fill_in 'User', with: @name.user_id
    click_on 'Update Name'

    assert_text 'Name was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Name' do
    visit name_url(@name)
    click_on 'Destroy this name', match: :first

    assert_text 'Name was successfully destroyed'
  end
end
