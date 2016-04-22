module Spree
  module Admin
    class RulesController < ResourceController
      before_action :load_data

      def model_class
        Dish::Rule
      end

      def index
        Dish::DishType.all.each do |dish_type|
          Dish::Rule.find_or_create_by(dish_type_id: dish_type.id)
        end
        @rules = Dish::Rule.all
      end

      def show
        redirect_to action: :index
      end

      def load_data
      end

      def update_rules
        rule_params = {:rule => params["rule"].values}
        Dish::Rule.update(rule_params[:rule].map{|x| x["id"]}, rule_params[:rule].map{|x| {quantity: x["quantity"]}})
      end

      private

       def rule_params
          params.require(:rule).permit(:id, :quantity)
       end

      def location_after_save
        admin_rules_url
      end

    end
  end
end
