module Spree
  module Api
    class AvailableOnsController < Spree::Api::BaseController
      def create
      	a_o= Dish::AvailableOn.where(product_id: available_on_params[:product_id],delivery_date: available_on_params[:delivery_date])
        unless a_o.count == 0
          @status = [{ "messages" => "Duplicate"}]
          render "spree/api/logger/log", status: 400
        else
          @available_on = Dish::AvailableOn.new(available_on_params)
          if @available_on.save!
            @products = Spree::Product.find(available_on_params[:product_id])
            render "spree/api/available_ons/serve_date", status: 200
          else
            @status = [{ "messages" => "something is wrong"}]
            render "spree/api/logger/log", status: 400
          end
        end
      end

      def serve_date
        if params[:serve_date]
          date = Date.parse(params[:serve_date])
          product_ids = Dish::AvailableOn.where(:delivery_date => date).pluck(:product_id)
          @products = Spree::Product.where(:id => product_ids)
          render "spree/api/available_ons/serve_date", status: 200
        end
      end

      def serve_date_delete
        if params[:serve_date].present? && params[:product_id].present?
          Dish::AvailableOn.where(delivery_date: params[:serve_date],product_id: params[:product_id]).destroy_all
          @status = [{ "messages" => "success"}]
          render "spree/api/logger/log", status: 200
        else
          @status = [{ "messages" => "something is wrong"}]
          render "spree/api/logger/log", status: 404
        end
      end

      private

      def available_on_params
        params.require(:available_on).permit(:product_id, :delivery_date)
      end

    end
  end
end
