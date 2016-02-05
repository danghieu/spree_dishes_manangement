module Spree
  module Admin
    class ProductsNutritionsController < ResourceController
      before_action :load_index_data, only: :index

      def model_class
        Dish::ProductsNutrition
      end

      def load_index_data
        @product = Spree::Product.friendly.find(params[:product_id])
      end

    end
  end
end
