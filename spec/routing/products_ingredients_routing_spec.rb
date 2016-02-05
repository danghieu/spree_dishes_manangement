require "rails_helper"

RSpec.describe ProductsIngredientsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/products_ingredients").to route_to("products_ingredients#index")
    end

    it "routes to #new" do
      expect(:get => "/products_ingredients/new").to route_to("products_ingredients#new")
    end

    it "routes to #show" do
      expect(:get => "/products_ingredients/1").to route_to("products_ingredients#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/products_ingredients/1/edit").to route_to("products_ingredients#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/products_ingredients").to route_to("products_ingredients#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/products_ingredients/1").to route_to("products_ingredients#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/products_ingredients/1").to route_to("products_ingredients#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/products_ingredients/1").to route_to("products_ingredients#destroy", :id => "1")
    end

  end
end
