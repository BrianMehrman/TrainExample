require "spec_helper"

describe TrainsController do
  describe "routing" do

    it "routes to #index" do
      get("/trains").should route_to("trains#index")
    end

    it "routes to #new" do
      get("/trains/new").should route_to("trains#new")
    end

    it "routes to #show" do
      get("/trains/1").should route_to("trains#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trains/1/edit").should route_to("trains#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trains").should route_to("trains#create")
    end

    it "routes to #update" do
      put("/trains/1").should route_to("trains#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trains/1").should route_to("trains#destroy", :id => "1")
    end

  end
end
