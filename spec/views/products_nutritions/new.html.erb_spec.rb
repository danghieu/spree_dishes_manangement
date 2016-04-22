require 'rails_helper'

RSpec.describe "products_nutritions/new", type: :view do
  before(:each) do
    assign(:products_nutrition, ProductsNutrition.new())
  end

  it "renders new products_nutrition form" do
    render

    assert_select "form[action=?][method=?]", products_nutritions_path, "post" do
    end
  end
end
