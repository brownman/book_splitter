require "spec_helper"

describe ComparesController do
  describe "routing" do

    it "routes to #index" do
      get("/compares").should route_to("compares#index")
    end

    it "routes to #new" do
      get("/compares/new").should route_to("compares#new")
    end

    it "routes to #show" do
      get("/compares/1").should route_to("compares#show", :id => "1")
    end

    it "routes to #edit" do
      get("/compares/1/edit").should route_to("compares#edit", :id => "1")
    end

    it "routes to #create" do
      post("/compares").should route_to("compares#create")
    end

    it "routes to #update" do
      put("/compares/1").should route_to("compares#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/compares/1").should route_to("compares#destroy", :id => "1")
    end

  end
end
