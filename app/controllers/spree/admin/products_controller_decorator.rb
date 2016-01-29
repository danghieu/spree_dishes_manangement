Spree::Admin::ProductsController.class_eval do

  def destroy_multiple
    Spree::Product.destroy(params[:products])  
    redirect_to action: :index   
  end

end