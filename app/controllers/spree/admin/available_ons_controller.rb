module Spree
  module Admin
    class AvailableOnsController < ResourceController
      before_action :load_data

      def model_class
        Dish::AvailableOn
      end

      def show
        redirect_to action: :edit
      end

      def load_data
        @products = Spree::Product.all
        date = Date.today
        puts "2222222222222222222222222222222222222222222222222222222222222222222222222222222222"
        puts Date.beginning_of_week

        puts "2222222222222222222222222222222222222222222222222222222222222222222222222222222222"

      end

      def location_after_save
        admin_available_ons_url
      end

    end
  end
end