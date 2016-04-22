module Dish
  class Supplier < Spree::Base
    validates_presence_of :name
  end
end
