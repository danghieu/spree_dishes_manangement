module Dish
	class ProductsNutrition < Spree::Base
		belongs_to :product, :class_name => "Spree::Product", foreign_key: "product_id"
		belongs_to :nutrition, :class_name => "Dish::Nutrition", foreign_key: "nutrition_id"

		accepts_nested_attributes_for :nutrition,
		                               :reject_if => :all_blank
		accepts_nested_attributes_for :product,
		                               :reject_if => :all_blank
	end
end
