require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before(:each) do
    @product = Product.new
    @category = Category.new name: 'test'
  end

  describe 'Validations' do
    
    it 'saves all attributes' do
      @newProduct = Product.new(name: 'planter', price: 3000, quantity: 20, category: @category)
      @newProduct.save
      expect(@newProduct).to be_present
    end
    
    it 'does not validate without a name' do
      if @product.name = nil
      expect(@product.errors.messages[:name]).to include("can't be blank")
      end
    end

    it 'does not validate without a price' do
      if @product.price = nil
      expect(@product.errors.messages[:price]).to include("can't be blank")
      end
    end

    it 'does not validate without a quantity' do
      if @product.quantity = nil
      expect(@product.errors.messages[:quantity]).to include("can't be blank")
      end
    end

    it 'does not validate without a category' do
      if @product.category = nil
      expect(@product.errors.messages[:category]).to include("can't be blank")
      end
    end
end
end
