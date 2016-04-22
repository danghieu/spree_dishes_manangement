class CreateProductsIngredients < ActiveRecord::Migration
  def change
    create_table :products_ingredients do |t|
      t.integer :product_id
      t.integer :ingredient_id
    end

    add_foreign_key :products_ingredients, :spree_products, column: 'product_id'
    add_foreign_key :products_ingredients, :ingredients
  end
end
