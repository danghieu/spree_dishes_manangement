module Dish
	class ProductsIngredient < Spree::Base
		
		belongs_to :product, :class_name => "Spree::Product", foreign_key: "product_id"
		belongs_to :ingredient, :class_name => "Dish::Ingredient", foreign_key: "ingredient_id"

		accepts_nested_attributes_for :ingredient,
		                               :reject_if => :all_blank
	end
end
