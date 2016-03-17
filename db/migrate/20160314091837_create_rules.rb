class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
    	t.integer :dish_type_id
    	t.integer :quantity , :default => 0
      t.timestamps null: false
    end
  end
end
