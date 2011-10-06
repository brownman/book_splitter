require "spec_helper"

describe DraftsController do
  describe "routing" do

    it "routes to #index" do
      get("/drafts").should route_to("drafts#index")
    end

    it "routes to #new" do
      get("/drafts/new").should route_to("drafts#new")
    end

    it "routes to #show" do
      get("/drafts/1").should route_to("drafts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/drafts/1/edit").should route_to("drafts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/drafts").should route_to("drafts#create")
    end

    it "routes to #update" do
      put("/drafts/1").should route_to("drafts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/drafts/1").should route_to("drafts#destroy", :id => "1")
    end

  end
end
