require "spec_helper"

describe SmartsController do
  describe "routing" do

    it "routes to #index" do
      get("/smarts").should route_to("smarts#index")
    end

    it "routes to #new" do
      get("/smarts/new").should route_to("smarts#new")
    end

    it "routes to #show" do
      get("/smarts/1").should route_to("smarts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/smarts/1/edit").should route_to("smarts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/smarts").should route_to("smarts#create")
    end

    it "routes to #update" do
      put("/smarts/1").should route_to("smarts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/smarts/1").should route_to("smarts#destroy", :id => "1")
    end

  end
end
