class AddDescriptionAndActiveToDishType < ActiveRecord::Migration
  def change
  	add_column :dish_types, :description, :string
  	add_column :dish_types,  :is_active, :boolean, :default => true
  end
end
