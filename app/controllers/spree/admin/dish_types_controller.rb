module Spree
  module Admin
    class DishTypesController < ResourceController
      before_action :load_data, except: :index

      def model_class
        Dish::DishType
      end

      def show
        redirect_to action: :edit
      end

      def load_data
      end

      def location_after_save
        admin_dish_types_url
      end

      def destroy_multiple
        Dish::DishType.destroy(params[:dish_types])  
        redirect_to action: :index   
      end
    end
  end
end