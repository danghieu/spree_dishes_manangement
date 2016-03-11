require "rails_helper"

RSpec.describe DishTypeImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dish_type_images").to route_to("dish_type_images#index")
    end

    it "routes to #new" do
      expect(:get => "/dish_type_images/new").to route_to("dish_type_images#new")
    end

    it "routes to #show" do
      expect(:get => "/dish_type_images/1").to route_to("dish_type_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dish_type_images/1/edit").to route_to("dish_type_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dish_type_images").to route_to("dish_type_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/dish_type_images/1").to route_to("dish_type_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/dish_type_images/1").to route_to("dish_type_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dish_type_images/1").to route_to("dish_type_images#destroy", :id => "1")
    end

  end
end
