require 'rails_helper'

RSpec.describe "shops/new", type: :view do
  before(:each) do
    assign(:shop, Shop.new(
      name: "MyString",
      description: "MyText",
      adress: "MyText",
      seller: ""
    ))
  end

  it "renders new shop form" do
    render

    assert_select "form[action=?][method=?]", shops_path, "post" do

      assert_select "input[name=?]", "shop[name]"

      assert_select "textarea[name=?]", "shop[description]"

      assert_select "textarea[name=?]", "shop[adress]"

      assert_select "input[name=?]", "shop[seller]"
    end
  end
end
