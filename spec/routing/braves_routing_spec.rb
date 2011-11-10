require "spec_helper"

describe BravesController do
  describe "routing" do

    it "routes to #index" do
      get("/braves").should route_to("braves#index")
    end

    it "routes to #new" do
      get("/braves/new").should route_to("braves#new")
    end

    it "routes to #show" do
      get("/braves/1").should route_to("braves#show", :id => "1")
    end

    it "routes to #edit" do
      get("/braves/1/edit").should route_to("braves#edit", :id => "1")
    end

    it "routes to #create" do
      post("/braves").should route_to("braves#create")
    end

    it "routes to #update" do
      put("/braves/1").should route_to("braves#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/braves/1").should route_to("braves#destroy", :id => "1")
    end

  end
end
