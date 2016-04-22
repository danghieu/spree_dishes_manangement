require "rails_helper"

RSpec.describe AvailableOnsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/available_ons").to route_to("available_ons#index")
    end

    it "routes to #new" do
      expect(:get => "/available_ons/new").to route_to("available_ons#new")
    end

    it "routes to #show" do
      expect(:get => "/available_ons/1").to route_to("available_ons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/available_ons/1/edit").to route_to("available_ons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/available_ons").to route_to("available_ons#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/available_ons/1").to route_to("available_ons#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/available_ons/1").to route_to("available_ons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/available_ons/1").to route_to("available_ons#destroy", :id => "1")
    end

  end
end
