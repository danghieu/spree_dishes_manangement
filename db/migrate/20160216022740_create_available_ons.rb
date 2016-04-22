class CreateAvailableOns < ActiveRecord::Migration
  def change
    create_table :available_ons do |t|
    	t.integer :product_id
    	t.date :delivery_date
      t.timestamps null: false
    end
    add_foreign_key :available_ons, :spree_products, column: 'product_id'
  end
end
