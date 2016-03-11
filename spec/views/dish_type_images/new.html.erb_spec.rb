require 'rails_helper'

RSpec.describe "dish_type_images/new", type: :view do
  before(:each) do
    assign(:dish_type_image, DishTypeImage.new())
  end

  it "renders new dish_type_image form" do
    render

    assert_select "form[action=?][method=?]", dish_type_images_path, "post" do
    end
  end
end
