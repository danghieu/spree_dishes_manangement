require 'rails_helper'

RSpec.describe "dish_type_images/show", type: :view do
  before(:each) do
    @dish_type_image = assign(:dish_type_image, DishTypeImage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
