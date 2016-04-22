module Dish
  class Rule < Spree::Base
    belongs_to :dish_type, :class_name => "Dish::DishType", foreign_key: "dish_type_id"

  end
end
