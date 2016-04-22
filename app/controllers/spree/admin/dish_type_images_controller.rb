module Spree
  module Admin
    class DishTypeImagesController < ResourceController
       before_action :load_data

      create.before :set_viewable
      update.before :set_viewable

      def model_class
        Dish::DishTypeImage
      end

      def edit
      end

      def new
        @dish_type_image = @dish_type.images.build
      end

      private 
        def location_after_destroy
        end

        def location_after_save
          admin_dish_type_dish_type_images_url(@dish_type)
        end

        def load_data
          @dish_type = Dish::DishType.find(params[:dish_type_id])
        end

        def set_viewable
          @dish_type_image.viewable_type = 'Dish::DishType'
          @dish_type_image.viewable_id = params[:dish_type_image][:viewable_id]
        end
    end
  end
end