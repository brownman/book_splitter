require "spec_helper"

describe AssemblersController do
  describe "routing" do

    it "routes to #index" do
      get("/assemblers").should route_to("assemblers#index")
    end

    it "routes to #new" do
      get("/assemblers/new").should route_to("assemblers#new")
    end

    it "routes to #show" do
      get("/assemblers/1").should route_to("assemblers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/assemblers/1/edit").should route_to("assemblers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/assemblers").should route_to("assemblers#create")
    end

    it "routes to #update" do
      put("/assemblers/1").should route_to("assemblers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/assemblers/1").should route_to("assemblers#destroy", :id => "1")
    end

  end
end
