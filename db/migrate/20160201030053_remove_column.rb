class RemoveColumn < ActiveRecord::Migration
   def up
    remove_column :spree_products, :dish_price
    remove_column :spree_products, :dish_currency
    remove_column :spree_products, :dish_image_url
  end

  def down
    add_column :spree_products, :dish_price, :decimal, precision: 10, scale: 2
  	add_column :spree_products, :dish_currency, :string
  	add_column :spree_products, :dish_image_url, :text
  end
end
