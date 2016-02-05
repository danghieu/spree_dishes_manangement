module Dish
	class ProductsNutrition < Spree::Base
		belongs_to :product, :class_name => "Spree::Product", foreign_key: "product_id"
		belongs_to :nutritions, :class_name => "Dish::Nutrition", foreign_key: "nutrition_id"

		accepts_nested_attributes_for :nutritions,
		                               :reject_if => :all_blank
	end
end
