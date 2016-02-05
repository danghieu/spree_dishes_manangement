require 'rails_helper'

RSpec.describe "products_nutritions/show", type: :view do
  before(:each) do
    @products_nutrition = assign(:products_nutrition, ProductsNutrition.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
