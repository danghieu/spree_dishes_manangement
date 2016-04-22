require 'rails_helper'

RSpec.describe "product_ingredients/new", type: :view do
  before(:each) do
    assign(:product_ingredient, ProductIngredient.new())
  end

  it "renders new product_ingredient form" do
    render

    assert_select "form[action=?][method=?]", product_ingredients_path, "post" do
    end
  end
end
