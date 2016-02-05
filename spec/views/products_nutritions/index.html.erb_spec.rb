require 'rails_helper'

RSpec.describe "products_nutritions/index", type: :view do
  before(:each) do
    assign(:products_nutritions, [
      ProductsNutrition.create!(),
      ProductsNutrition.create!()
    ])
  end

  it "renders a list of products_nutritions" do
    render
  end
end
