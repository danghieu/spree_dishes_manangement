module Dish
	class Ingredient < Spree::Base
		validates_presence_of :name
		has_many :images, as: :viewable, dependent: :destroy, class_name: "Dish::IngredientImage"
		has_many :products, through: :products_ingredients, :class_name => "Spree::Product"
		has_many :products_ingredients, :class_name => "Dish::ProductsIngredient", foreign_key: 'ingredient_id'
		
		# before_destroy :products_ingredients?
		# def products_ingredients?
  #     errors.add(:base, "Cannot delete") unless products_ingredients.count == 0
  #   end
		def can_be_deleted?
			products_ingredients.count == 0
		end

    
	end
end
