require 'rails_helper'

RSpec.describe "dish_types/new", type: :view do
  before(:each) do
    assign(:dish_type, DishType.new(
      :name => "MyText"
    ))
  end

  it "renders new dish_type form" do
    render

    assert_select "form[action=?][method=?]", dish_types_path, "post" do

      assert_select "textarea#dish_type_name[name=?]", "dish_type[name]"
    end
  end
end
