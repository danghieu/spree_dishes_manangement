require 'rails_helper'

RSpec.describe "product_ingredients/show", type: :view do
  before(:each) do
    @product_ingredient = assign(:product_ingredient, ProductIngredient.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
