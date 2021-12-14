require 'rails_helper'

RSpec.describe "shops/index", type: :view do
  before(:each) do
    assign(:shops, [
      Shop.create!(
        name: "Name",
        description: "MyText",
        adress: "MyText",
        seller: ""
      ),
      Shop.create!(
        name: "Name",
        description: "MyText",
        adress: "MyText",
        seller: ""
      )
    ])
  end

  it "renders a list of shops" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
