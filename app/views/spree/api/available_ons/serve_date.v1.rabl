object false
child(@products => :products) do
  attributes :id, :name
  node(:dish_type){ |p| p.dish_type.name if p.dish_type }
  child(:variant_images => :images) { extends "spree/api/images/show" }
end


