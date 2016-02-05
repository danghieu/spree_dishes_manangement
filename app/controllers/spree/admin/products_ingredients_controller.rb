module Spree
  module Admin
    class ProductsIngredientsController < ResourceController
      before_action :load_index_data, only: :index

      def model_class
        Dish::ProductsIngredient
      end

      def location_after_save
        #admin_product_products_ingredients_url
      end

      def load_index_data
        @ingredients = Dish::Ingredient.all
        @product = Spree::Product.friendly.find(params[:product_id])
      end

    end
  end
end
