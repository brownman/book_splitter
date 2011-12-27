require "spec_helper"

describe SmilesController do
  describe "routing" do

    it "routes to #index" do
      get("/smiles").should route_to("smiles#index")
    end

    it "routes to #new" do
      get("/smiles/new").should route_to("smiles#new")
    end

    it "routes to #show" do
      get("/smiles/1").should route_to("smiles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/smiles/1/edit").should route_to("smiles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/smiles").should route_to("smiles#create")
    end

    it "routes to #update" do
      put("/smiles/1").should route_to("smiles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/smiles/1").should route_to("smiles#destroy", :id => "1")
    end

  end
end
