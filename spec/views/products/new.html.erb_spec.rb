require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      name: "MyString",
      description: "MyString",
      amount: "MyString",
      seller: nil,
      shop: nil
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[amount]"

      assert_select "input[name=?]", "product[seller_id]"

      assert_select "input[name=?]", "product[shop_id]"
    end
  end
end
