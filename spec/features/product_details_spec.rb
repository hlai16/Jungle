require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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
  
  scenario "Product detail shows when clicked on Details link" do
    visit root_path
    product1 = page.all('.product')[0]
    product1.click_on 'Details'
    expect(page).to have_css '.products-show'
    save_and_open_screenshot

    visit root_path
    product1 = page.all('.product header a')[0]
    product1.click
    expect(page).to have_css '.products-show'
    save_and_open_screenshot
  end
end
