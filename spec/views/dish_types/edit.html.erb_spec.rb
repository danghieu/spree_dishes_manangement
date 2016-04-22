require 'rails_helper'

RSpec.describe "dish_types/edit", type: :view do
  before(:each) do
    @dish_type = assign(:dish_type, DishType.create!(
      :name => "MyText"
    ))
  end

  it "renders the edit dish_type form" do
    render

    assert_select "form[action=?][method=?]", dish_type_path(@dish_type), "post" do

      assert_select "textarea#dish_type_name[name=?]", "dish_type[name]"
    end
  end
end
