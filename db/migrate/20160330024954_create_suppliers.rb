class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.text :name
      t.text :description
      t.timestamps null: false
    end
  end
end
