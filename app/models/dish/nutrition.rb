module Dish
	class Nutrition < Spree::Base
		validates_presence_of :name
	end
end
