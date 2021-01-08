require "rails_helper"

RSpec.describe ChatroomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/chatrooms").to route_to("chatrooms#index")
    end

    it "routes to #new" do
      expect(get: "/chatrooms/new").to route_to("chatrooms#new")
    end

    it "routes to #show" do
      expect(get: "/chatrooms/1").to route_to("chatrooms#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/chatrooms/1/edit").to route_to("chatrooms#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/chatrooms").to route_to("chatrooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/chatrooms/1").to route_to("chatrooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/chatrooms/1").to route_to("chatrooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/chatrooms/1").to route_to("chatrooms#destroy", id: "1")
    end
  end
end
