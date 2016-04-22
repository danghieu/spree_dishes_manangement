require "rails_helper"

RSpec.describe ProductIngredientsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/product_ingredients").to route_to("product_ingredients#index")
    end

    it "routes to #new" do
      expect(:get => "/product_ingredients/new").to route_to("product_ingredients#new")
    end

    it "routes to #show" do
      expect(:get => "/product_ingredients/1").to route_to("product_ingredients#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/product_ingredients/1/edit").to route_to("product_ingredients#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/product_ingredients").to route_to("product_ingredients#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/product_ingredients/1").to route_to("product_ingredients#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/product_ingredients/1").to route_to("product_ingredients#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_ingredients/1").to route_to("product_ingredients#destroy", :id => "1")
    end

  end
end
