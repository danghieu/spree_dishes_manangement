require 'rails_helper'

RSpec.describe "dish_type_images/edit", type: :view do
  before(:each) do
    @dish_type_image = assign(:dish_type_image, DishTypeImage.create!())
  end

  it "renders the edit dish_type_image form" do
    render

    assert_select "form[action=?][method=?]", dish_type_image_path(@dish_type_image), "post" do
    end
  end
end
