require 'rails_helper'

RSpec.describe Product, type: :model do
  seller = Seller.first_or_create(email: 'seller@gmail.com')
  shop = Shop.first_or_create(name: 'Foo3')

  it 'should have a name' do
    product = Product.new(
      name: '',
      description: 'This is a perfect product',
      amount: 12.12,
      seller: seller,
      shop: shop
    )
    expect(product).not_to be_valid

    product.name = 'Poo'
    expect(product).to be_valid
  end

  # it 'should have a uniqe name' do
  #   Product.create!(
  #     name: 'Poo2',
  #     description: 'This is a perfect product',
  #     amount: 12.12,
  #     seller: seller,
  #     shop: shop
  #   )
  #   product = Product.new(
  #     name: 'Poo2',
  #     description: 'This is a perfect product',
  #     amount: 12.12,
  #     seller: seller,
  #     shop: shop
  #   )
  #   expect(product).not_to be_valid
  # end

  # amount için yazıcam

  it 'should have a amount' do
    product = Product.new(
      name: 'Foo4',
      description: 'This is a perfect product',
      amount: nil,
      seller: seller,
      shop: shop
    )

    expect(product).not_to be_valid
  end

  it 'is equal to a float of the same value' do
    product = Product.new(
      name: 'Poo2',
      description: 'This is a perfect product',
      amount: 12,
      seller: seller,
      shop: shop
    )
    expect(product.amount).to eql(12.0)
  end

  it "'s amount should has greater than 0" do
    product = Product.new(
      name: 'Poo2',
      description: 'This is a perfect product',
      amount: -1,
      seller: seller,
      shop: shop
    )
    expect(product.amount).not_to be > 0

    product = Product.new(
      name: 'Poo2',
      description: 'This is a perfect product',
      amount: 0,
      seller: seller,
      shop: shop
    )
    expect(product.amount).not_to be > 0

    product = Product.new(
      name: 'Poo2',
      description: 'This is a perfect product',
      amount: 10,
      seller: seller,
      shop: shop
    )
    expect(product.amount).to be > 0
  end
end
