require 'rails_helper'

RSpec.describe "product_ingredients/index", type: :view do
  before(:each) do
    assign(:product_ingredients, [
      ProductIngredient.create!(),
      ProductIngredient.create!()
    ])
  end

  it "renders a list of product_ingredients" do
    render
  end
end
