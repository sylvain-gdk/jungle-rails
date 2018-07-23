require 'rails_helper'

RSpec.describe Product, type: :model do

  context "Validations:" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price_cents) }
    it { is_expected.to validate_numericality_of(:price_cents) }
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
      @product.price_cents = 39999
      @product.quantity = 54
      @product.category = @category
    end

    it 'should save when all elements are in' do
      expect(@product).to be_valid
    end

    it 'should have a name' do
      #@product.name = nil
      expect(@product.name).to eql('Toaster')
    end

    it 'should have a price in cents' do
      #@product.price_cents = nil
      expect(@product.price_cents).to eql(39999)
    end

    it 'should have a quantity' do
      #@product.quantity = nil
      expect(@product.quantity).to eql(54)
    end

    it 'should have and belong to a category' do
      #@product.category = nil
      expect(@product.category).to eql(@category)
    end
  end
end
