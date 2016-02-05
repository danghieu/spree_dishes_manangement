module Dish
	class Ingredient < Spree::Base
		validates_presence_of :name
		has_many :images, as: :viewable, dependent: :destroy, class_name: "Dish::IngredientImage"
		has_many :products, through: :products_ingredients, :class_name => "Spree::Product"
		has_many :products_ingredients, :class_name => "Dish::ProductsIngredient", foreign_key: 'ingredient_id'
	end
end
