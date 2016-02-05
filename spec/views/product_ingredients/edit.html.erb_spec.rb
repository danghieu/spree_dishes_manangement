require 'rails_helper'

RSpec.describe "product_ingredients/edit", type: :view do
  before(:each) do
    @product_ingredient = assign(:product_ingredient, ProductIngredient.create!())
  end

  it "renders the edit product_ingredient form" do
    render

    assert_select "form[action=?][method=?]", product_ingredient_path(@product_ingredient), "post" do
    end
  end
end
