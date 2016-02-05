require 'rails_helper'

RSpec.describe "products_ingredients/edit", type: :view do
  before(:each) do
    @products_ingredient = assign(:products_ingredient, ProductsIngredient.create!())
  end

  it "renders the edit products_ingredient form" do
    render

    assert_select "form[action=?][method=?]", products_ingredient_path(@products_ingredient), "post" do
    end
  end
end
