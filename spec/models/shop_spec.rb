require 'rails_helper'

RSpec.describe Shop, type: :model do
  seller = Seller.first_or_create(email: 'seller@gmail.com')
  it 'has a name' do
    shop = Shop.new(
      id: 123,
      name: nil,
      description: 'lorem ipsumda ipsum lorem mi?',
      adress: 'Levent Istanbul',
      seller: seller
    )
    expect(shop).not_to be_valid

    shop.name = 'Foo'
    expect(shop).to be_valid
  end

  it 'should have a uniqe name' do
    Shop.create!(name: 'Foo2', seller: seller)

    shop = Shop.new(
      id: 123,
      name: 'Foo2',
      description: 'lorem ipsumda ipsum lorem mi?',
      adress: 'Levent Istanbul',
      seller: seller
    )
    expect(shop).not_to be_valid

    shop.name = 'Foo3'
    expect(shop).to be_valid
  end

  it 'should have a seller' do
    shop = Shop.new(
      id: 123,
      name: 'Foo2',
      description: 'lorem ipsumda ipsum lorem mi?',
      adress: 'Levent Istanbul',
      seller: nil
    )
    expect(shop).not_to be_valid

    shop.seller = seller
    expect(shop).to be_valid
  end
end
