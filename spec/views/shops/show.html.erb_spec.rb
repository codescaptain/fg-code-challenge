require 'rails_helper'

RSpec.describe "shops/show", type: :view do
  before(:each) do
    @shop = assign(:shop, Shop.create!(
      name: "Name",
      description: "MyText",
      adress: "MyText",
      seller: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
