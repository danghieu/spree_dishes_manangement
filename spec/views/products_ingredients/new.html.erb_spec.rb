require 'rails_helper'

RSpec.describe "products_ingredients/new", type: :view do
  before(:each) do
    assign(:products_ingredient, ProductsIngredient.new())
  end

  it "renders new products_ingredient form" do
    render

    assert_select "form[action=?][method=?]", products_ingredients_path, "post" do
    end
  end
end
