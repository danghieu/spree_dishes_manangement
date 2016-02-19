module Dish
	class Nutrition < Spree::Base
		validates_presence_of :name
		has_many :products, through: :products_nutritions, :class_name => "Spree::Product"
		has_many :products_nutritions, :class_name => "Dish::ProductsNutrition"

		accepts_nested_attributes_for :products_nutritions,
             :reject_if => :all_blank,
             :allow_destroy => true
        accepts_nested_attributes_for :products
		
		def can_be_deleted?
			products_nutritions.count == 0
		end
	end
end
