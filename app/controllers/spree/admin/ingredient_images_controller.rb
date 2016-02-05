module Spree
  module Admin
    class IngredientImagesController < ResourceController
       before_action :load_data

      create.before :set_viewable
      update.before :set_viewable

      def model_class
        Dish::IngredientImage
      end

      def edit
      end

      def new
        @ingredient_image = @ingredient.images.build
      end

      private 
        def location_after_destroy
          admin_ingredient(@ingredient)
        end

        def location_after_save
          admin_ingredient_ingredient_images_url(@ingredient)
        end

        def load_data
          @ingredient = Dish::Ingredient.find(params[:ingredient_id])
        end

        def set_viewable
          @ingredient_image.viewable_type = 'Dish::Ingredient'
          @ingredient_image.viewable_id = params[:ingredient_image][:viewable_id]
        end
    end
  end
end