require 'rails_helper'

RSpec.describe Product, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:category) }

  before :each do
    @user = User.create(
      first_name: "Bob",
      last_name: "Marley",
      email: "blabla@bla.com",
      password: '1234',
      password_confirmation: '1234'
    )

    @category = Category.create(
      name: 'Apparel'
    )

    @product = @category.products.create(
      name: 'Toaster',
      price: 39.99,
      quantity: 18,
      category: @category
    )

    @rev1 = @product.reviews.create(
      user: @user,
      product: @product,
      description: Faker::Hipster.paragraph(4),
      rating: 2
    )

    @rev2 = @product.reviews.create(
      user: @user,
      product: @product,
      description: Faker::Hipster.paragraph(4),
      rating: 5
    )
    @rev3 = @product.reviews.create(
      user: @user,
      product: @product,
      description: Faker::Hipster.paragraph(4),
      rating: 5
    )
    @rev4 = @product.reviews.create(
      user: @user,
      product: @product,
      description: Faker::Hipster.paragraph(4),
      rating: 4
    )
    @rev5 = @product.reviews.create(
      user: @user,
      product: @product,
      description: Faker::Hipster.paragraph(4),
      rating: 2
    )
  end

  it 'should have price as numbers' do
    @product.price = 'Hello'
    expect(@product).to_not be_valid
  end

  it 'should have quantity as an integer' do
    @product.quantity = 3.5
    expect(@product).to_not be_valid
  end

  describe '.avg_rating' do
    it 'should return average rating for each' do
      expect(@product.avg_rating(@product)).to eql(3)
    end
  end

end
