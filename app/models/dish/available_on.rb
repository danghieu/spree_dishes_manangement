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
      rules.each do |rule|
        ps = Spree::Product.where(dish_type_id: rule.dish_type_id).limit(rule.quantity)
        ps.each do |p|
          products<< p
        end
      end
      if max_d.nil?
        21.times.each do |i|
          products.each do |p|
            delivery_date = monday-7+i
            Dish::AvailableOn.create(product_id: p.id,delivery_date: delivery_date)
          end
        end
      else
        if nextWeek > max_d
          7.times.each do |i|
            products.each do |p|
              delivery_date = nextWeek+i
              Dish::AvailableOn.create(product_id: p.id,delivery_date: delivery_date)
            end
          end
        end
      end

    end

  end
end	