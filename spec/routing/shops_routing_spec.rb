require "rails_helper"

RSpec.describe ShopsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/shops").to route_to("shops#index")
    end

    it "routes to #new" do
      expect(get: "/shops/new").to route_to("shops#new")
    end

    it "routes to #show" do
      expect(get: "/shops/1").to route_to("shops#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/shops/1/edit").to route_to("shops#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/shops").to route_to("shops#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/shops/1").to route_to("shops#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shops/1").to route_to("shops#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/shops/1").to route_to("shops#destroy", id: "1")
    end
  end
end
