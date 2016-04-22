require 'rails_helper'

RSpec.describe "ingredients/new", type: :view do
  before(:each) do
    assign(:ingredient, Ingredient.new(
      :name => "MyString",
      :description => "MyString",
      :image_url => "MyText"
    ))
  end

  it "renders new ingredient form" do
    render

    assert_select "form[action=?][method=?]", ingredients_path, "post" do

      assert_select "input#ingredient_name[name=?]", "ingredient[name]"

      assert_select "input#ingredient_description[name=?]", "ingredient[description]"

      assert_select "textarea#ingredient_image_url[name=?]", "ingredient[image_url]"
    end
  end
end
