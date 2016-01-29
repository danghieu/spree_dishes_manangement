module Dish
	class DishType < Spree::Base
		validates_presence_of :name
		has_many :product, dependent: :destroy, :class_name => "Spree::Product"
	end
end
