object false
child(@products => :products) do
  attributes :id, :name
	child(:dish_type => :dish_type){ extends "spree/api/dish_types/show" }
  child(:variant_images => :images) { extends "spree/api/images/show" }
end


