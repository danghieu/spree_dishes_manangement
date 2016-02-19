module Spree
  module Admin
    class ProductsNutritionsController < ResourceController
      before_action :load_index_data,:unit, only: :index

      def model_class
        Dish::ProductsNutrition
      end

      def load_index_data
        @product = Spree::Product.friendly.find(params[:product_id])
      end

      private
      def unit
        @units = [:select,:mg, :g, :kcal, :IU, :ml, :ug]
      end
    end
  end
end
