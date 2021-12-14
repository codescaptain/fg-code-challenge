require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      name: "MyString",
      description: "MyString",
      amount: "MyString",
      seller: nil,
      shop: nil
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[amount]"

      assert_select "input[name=?]", "product[seller_id]"

      assert_select "input[name=?]", "product[shop_id]"
    end
  end
end
