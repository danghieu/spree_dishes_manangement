require 'rails_helper'

RSpec.describe "products_ingredients/index", type: :view do
  before(:each) do
    assign(:products_ingredients, [
      ProductsIngredient.create!(),
      ProductsIngredient.create!()
    ])
  end

  it "renders a list of products_ingredients" do
    render
  end
end
