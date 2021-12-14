require 'rails_helper'

RSpec.describe "shops/edit", type: :view do
  before(:each) do
    @shop = assign(:shop, Shop.create!(
      name: "MyString",
      description: "MyText",
      adress: "MyText",
      seller: ""
    ))
  end

  it "renders the edit shop form" do
    render

    assert_select "form[action=?][method=?]", shop_path(@shop), "post" do

      assert_select "input[name=?]", "shop[name]"

      assert_select "textarea[name=?]", "shop[description]"

      assert_select "textarea[name=?]", "shop[adress]"

      assert_select "input[name=?]", "shop[seller]"
    end
  end
end
