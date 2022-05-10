require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before(:each) do
    @category = Category.new name: 'test'
  end

  describe 'Validations' do
    
    it 'saves all attributes' do
      @newProduct = Product.new(name: 'planter', price: 3000, quantity: 20, category: @category)
      @newProduct.save
      expect(@newProduct).to be_present
    end
    
    it 'does not validate without a name' do
      @product = Product.new(name: nil, price: 3000, quantity: 20, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'does not validate without a price' do
      @product = Product.new(name: 'planter', price: ' ', quantity: 20, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it 'does not validate without a quantity' do
      @product = Product.new(name: 'planter', price: 3000, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'does not validate without a category' do
      @product = Product.new(name: 'planter', price: 3000, quantity: 20, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
end
end
