module Spree
  module Admin
    class NutritionsController < ResourceController
      before_action :load_data, except: :index

      def model_class
        Dish::Nutrition
      end

      def show
        redirect_to action: :edit
      end

      def load_data
      end

      def location_after_save
        admin_nutritions_url
      end
      
      def destroy_multiple
        Dish::Nutrition.destroy(params[:nutritions])  
        redirect_to action: :index   
      end
    end
  end
end