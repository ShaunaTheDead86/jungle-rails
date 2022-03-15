require 'rails_helper'

RSpec.feature "Visitor can add an item to their cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    # REGISTER NEW USER
    visit '/users/new'

    within '#new_user' do
      fill_in 'user[first_name]', with: 'Jane'
      fill_in 'user[last_name]', with: 'Doe'
      fill_in 'user[email]', with: 'jane.doe@gmail.com'
      fill_in 'user[password]', with: 'janedoerulez!'
      fill_in 'user[password_confirmation]', with: 'janedoerulez!'
      click_button 'Register User'
    end
  end

  scenario "They see 10 products" do
    # ACT
    visit root_path
    
    # CLICK ONE OF THE ADD BUTTONS
    within(first('.product')) do
      click_on 'Add'
    end
    
    # VERIFY
    expect(page.has_content?("My Cart (1)"))

    # DEBUG
    save_and_open_screenshot
  end
end
