require 'rails_helper' 


RSpec.describe Product, type: :model do
  let(:category) {
    Category.create(name: "testing")
  }
 subject {
    category.products.create(
      name: "test",
      description: "for RSpec",
      image: "img",
      price_cents: 2000,
      quantity: 20,
    )
 }
  describe 'Validations' do
    # validation tests/examples here
    it 'should save product successfully if it has a name, price, quanity and category' do
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end
    it 'should be invalid if name is blank' do
      @product = subject 
      @product.name = nil 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end
    it 'should be invalid if price is blank' do
      @product = subject 
      @product.price_cents = nil 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end
    it 'should be invalid if quantity is blank' do
      @product = subject 
      @product.quantity = nil 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end
    it 'should be invalid if category is blank' do
      @product = subject 
      @product.category = nil 
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end


