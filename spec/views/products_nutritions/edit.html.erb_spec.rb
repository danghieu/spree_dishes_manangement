require 'rails_helper'

RSpec.describe "products_nutritions/edit", type: :view do
  before(:each) do
    @products_nutrition = assign(:products_nutrition, ProductsNutrition.create!())
  end

  it "renders the edit products_nutrition form" do
    render

    assert_select "form[action=?][method=?]", products_nutrition_path(@products_nutrition), "post" do
    end
  end
end
