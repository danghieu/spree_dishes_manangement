Spree::Api::ProductsController.class_eval do
  def serve_date
    if params[:serve_date]

      date = Date.Date.parse(params[:serve_date])
      date.strftime("%d %m, %Y")

      product_ids = Dish::AvailableOn.where(:delivery_date => date).pluck(:product_id)
      @products = Spree::Product.where(:id => product_ids)
      render "spree/api/products/index", status: 200
    end
  end
end