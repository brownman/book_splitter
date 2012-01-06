require "spec_helper"

describe HuntersController do
  describe "routing" do

    it "routes to #index" do
      get("/hunters").should route_to("hunters#index")
    end

    it "routes to #new" do
      get("/hunters/new").should route_to("hunters#new")
    end

    it "routes to #show" do
      get("/hunters/1").should route_to("hunters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hunters/1/edit").should route_to("hunters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hunters").should route_to("hunters#create")
    end

    it "routes to #update" do
      put("/hunters/1").should route_to("hunters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hunters/1").should route_to("hunters#destroy", :id => "1")
    end

  end
end
