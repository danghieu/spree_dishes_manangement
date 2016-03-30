module Spree
  module Admin
    class SuppliersController < ResourceController
      before_action :load_data, except: :index

      def model_class
        Dish::Supplier
      end

      def show
        redirect_to action: :edit
      end



      def load_data
      end

      def location_after_save
        admin_suppliers_url
      end

      def active
        @dish_type = Dish::DishType.find(params[:id])
        if @dish_type.is_active
          @dish_type.is_active =false
        else
          @dish_type.is_active =true
        end
        @dish_type.save
        redirect_to  admin_dish_types_url
      end

      def destroy_multiple
        Dish::DishType.destroy(params[:dish_types])
        flash[:success] = "Deleted Successfully"
        redirect_to action: :index   
      end

      def collection
        return @collection if @collection.present?
        params[:q] ||= {}
        params[:q][:deleted_at_null] ||= "1"

        params[:q][:s] ||= "name asc"
        @collection = super
        if params[:q].delete(:deleted_at_null) == '0'
          @collection = @collection.with_deleted
        end
        # @search needs to be defined as this is passed to search_form_for
        @search = @collection.ransack(params[:q])
        @collection = @search.result.
              page(params[:page]).
              per(params[:per_page] || Spree::Config[:admin_products_per_page])

        @collection
      end 
    end
  end
end