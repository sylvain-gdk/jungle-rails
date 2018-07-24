require 'rails_helper'

RSpec.describe Product, type: :model do

  context "Validations:" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:quantity) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context "Relationship:" do

    before :each do
      @category = Category.new
      @category.name = 'Apparel'
      @product = Product.new
      @product.name = 'Toaster'
      @product.price = 399.99
      @product.quantity = 54
    end

    it 'should have a name' do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it 'should have a price in cents' do
      @product.price = nil
      expect(@product).to_not be_valid
    end

    it 'should have a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it 'should have a category' do
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end
end
