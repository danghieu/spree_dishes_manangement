require 'rails_helper'

RSpec.describe "dish_type_images/index", type: :view do
  before(:each) do
    assign(:dish_type_images, [
      DishTypeImage.create!(),
      DishTypeImage.create!()
    ])
  end

  it "renders a list of dish_type_images" do
    render
  end
end
