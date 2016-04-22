Spree::Admin::ImagesController.class_eval do
	def location_after_save
        edit_admin_product_image_url(@product,@product.images.first)
    end
end