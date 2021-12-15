require 'rails_helper'

RSpec.describe "ShopFavorites", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/shop_favorites/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/shop_favorites/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
