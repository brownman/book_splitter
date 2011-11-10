require "spec_helper"

describe QuizesController do
  describe "routing" do

    it "routes to #index" do
      get("/quizes").should route_to("quizes#index")
    end

    it "routes to #new" do
      get("/quizes/new").should route_to("quizes#new")
    end

    it "routes to #show" do
      get("/quizes/1").should route_to("quizes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/quizes/1/edit").should route_to("quizes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/quizes").should route_to("quizes#create")
    end

    it "routes to #update" do
      put("/quizes/1").should route_to("quizes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/quizes/1").should route_to("quizes#destroy", :id => "1")
    end

  end
end
