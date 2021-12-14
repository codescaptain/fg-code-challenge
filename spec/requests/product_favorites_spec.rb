require 'rails_helper'

RSpec.describe "ProductFavorites", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/product_favorites/index"
      expect(response).to have_http_status(:success)
    end
  end

end
