require 'rails_helper'

RSpec.describe "products_ingredients/show", type: :view do
  before(:each) do
    @products_ingredient = assign(:products_ingredient, ProductsIngredient.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
