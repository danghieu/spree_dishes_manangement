module Dish
  class AvailableOn < Spree::Base
    belongs_to :product, :class_name => "Spree::Product"
    accepts_nested_attributes_for :product,
      :reject_if => :all_blank,
      :allow_destroy => true
  end
end
