Spree::Api::ProductsController.class_eval do
  def search
    if params[:q].present?     
      @products = Spree::Product.where("name LIKE ?","%#{params[:q]}%")
      render "spree/api/available_ons/serve_date", status: 200
  	else
  		render "spree/api/available_ons/serve_date", status: 204
    end
  end

  def get_all   
      @products = Spree::Product.all
      render "spree/api/available_ons/serve_date", status: 200
  end

end