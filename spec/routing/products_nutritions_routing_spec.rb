require "rails_helper"

RSpec.describe ProductsNutritionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/products_nutritions").to route_to("products_nutritions#index")
    end

    it "routes to #new" do
      expect(:get => "/products_nutritions/new").to route_to("products_nutritions#new")
    end

    it "routes to #show" do
      expect(:get => "/products_nutritions/1").to route_to("products_nutritions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/products_nutritions/1/edit").to route_to("products_nutritions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/products_nutritions").to route_to("products_nutritions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/products_nutritions/1").to route_to("products_nutritions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/products_nutritions/1").to route_to("products_nutritions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/products_nutritions/1").to route_to("products_nutritions#destroy", :id => "1")
    end

  end
end
