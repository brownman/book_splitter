require "spec_helper"

describe LinesController do
  describe "routing" do

    it "routes to #index" do
      get("/lines").should route_to("lines#index")
    end

    it "routes to #new" do
      get("/lines/new").should route_to("lines#new")
    end

    it "routes to #show" do
      get("/lines/1").should route_to("lines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lines/1/edit").should route_to("lines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lines").should route_to("lines#create")
    end

    it "routes to #update" do
      put("/lines/1").should route_to("lines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lines/1").should route_to("lines#destroy", :id => "1")
    end

  end
end
