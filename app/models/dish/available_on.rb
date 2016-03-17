module Dish
  class AvailableOn < Spree::Base
    belongs_to :product, :class_name => "Spree::Product"
    accepts_nested_attributes_for :product,
      :reject_if => :all_blank,
      :allow_destroy => true

    def self.add_product
      max_d = Dish::AvailableOn.maximum(:delivery_date)
      monday = Date.today.beginning_of_week
      nextWeek= monday+7
      rules = Dish::Rule.all
      ps=[]
      products=[]
      if nextWeek > max_d
        rules.each do |rule|
          ps = Spree::Product.where(dish_type_id: rule.dish_type_id).limit(rule.quantity)
          ps.each do |p|
            products<< p
          end
        end
        7.times.each do |i|
          products.each do |p|
            a = Dish::AvailableOn.new
            a.product_id = p.id
            a.delivery_date = nextWeek+7+i
            a.save
          end
        end
      end

    end

  end
end	