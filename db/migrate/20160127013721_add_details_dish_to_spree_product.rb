class AddDetailsDishToSpreeProduct < ActiveRecord::Migration
  def change
  	add_column :spree_products, :dish_type_id, :integer
  	add_column :spree_products, :dish_price, :decimal, precision: 10, scale: 2
  	add_column :spree_products, :dish_currency, :string
  	add_column :spree_products, :dish_cooking_intruction, :text
  	add_column :spree_products, :dish_image_url, :text
  end
end
