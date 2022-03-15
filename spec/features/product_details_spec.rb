require 'rails_helper'

RSpec.feature "Visitor navigates to Product Details page", type: :feature, js: true do

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
  end

  scenario "They can see a product details page when clicking on a product link from the home page" do
    # ACT
    visit root_path

    # CLICK ON LINK
    click_on "#{@category.products[0].name}"

    # VISIT LINK FROM HOME PAGE
    visit "/products/#{@category.products[0].id}"

    # DEBUG
    save_and_open_screenshot

    # VERIFY
    expect(page).to have_css 'section.products-show'
    expect(page).to have_css 'article.product-detail'
    expect(page.has_content?("#{@category.products[0].name}"))  # check Name is listed
    expect(page.has_content?("#{@category.products[0].description}")) # check Description is listed
    expect(page.has_content?("#{@category.products[0].price}")) # check Price is listed
    expect(page.has_content?("#{@category.products[0].quantity}"))  # check Quantity is listed
    expect(page.has_content?("#{Category.find(@category.products[0].category_id).name}")) # check Category Name is listed
  end
end
