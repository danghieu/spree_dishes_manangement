class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :spree_products, :dish_cooking_intruction, :dish_cooking_instructions
  end
end
