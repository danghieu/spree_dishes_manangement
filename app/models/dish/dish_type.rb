module Dish
  class DishType < Spree::Base
    validates_presence_of :name
    has_many :products, dependent: :destroy, :class_name => "Spree::Product"
    has_many :images, as: :viewable, dependent: :destroy, class_name: "Dish::DishTypeImage"

  end
end
