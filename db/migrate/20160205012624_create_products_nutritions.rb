class CreateProductsNutritions < ActiveRecord::Migration
  def change
    create_table :products_nutritions do |t|
      t.integer :product_id
      t.integer :nutrition_id
      t.decimal :quantity, precision: 10, scale: 2
      t.string :unit
    end

    add_foreign_key :products_nutritions, :spree_products, column: 'product_id'
    add_foreign_key :products_nutritions, :nutritions
  end
end
