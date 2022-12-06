require "rails_helper"

RSpec.describe SearchesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/searches").to route_to("searches#index")
    end

    it "routes to #new" do
      expect(get: "/searches/new").to route_to("searches#new")
    end

    it "routes to #show" do
      expect(get: "/searches/1").to route_to("searches#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/searches").to route_to("searches#create")
    end

    it "routes to #destroy" do
      expect(delete: "/searches/1").to route_to("searches#destroy", id: "1")
    end
  end
end
