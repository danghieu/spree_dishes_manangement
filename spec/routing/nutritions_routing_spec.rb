require "rails_helper"

RSpec.describe NutritionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/nutritions").to route_to("nutritions#index")
    end

    it "routes to #new" do
      expect(:get => "/nutritions/new").to route_to("nutritions#new")
    end

    it "routes to #show" do
      expect(:get => "/nutritions/1").to route_to("nutritions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/nutritions/1/edit").to route_to("nutritions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/nutritions").to route_to("nutritions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/nutritions/1").to route_to("nutritions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/nutritions/1").to route_to("nutritions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/nutritions/1").to route_to("nutritions#destroy", :id => "1")
    end

  end
end
