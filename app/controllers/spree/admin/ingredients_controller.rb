module Spree
  module Admin
    class IngredientsController < ResourceController
      before_action :load_data, except: :index

      def model_class
        Dish::Ingredient
      end

      def show
        redirect_to action: :edit
      end

      def load_data
      end

      def location_after_save
        admin_ingredients_url
      end
      
      def destroy_multiple
        Dish::Ingredient.destroy(params[:ingredients])  
        redirect_to action: :index   
      end
    end
  end
end