require 'rails_helper'

RSpec.describe "ingredients/edit", type: :view do
  before(:each) do
    @ingredient = assign(:ingredient, Ingredient.create!(
      :name => "MyString",
      :description => "MyString",
      :image_url => "MyText"
    ))
  end

  it "renders the edit ingredient form" do
    render

    assert_select "form[action=?][method=?]", ingredient_path(@ingredient), "post" do

      assert_select "input#ingredient_name[name=?]", "ingredient[name]"

      assert_select "input#ingredient_description[name=?]", "ingredient[description]"

      assert_select "textarea#ingredient_image_url[name=?]", "ingredient[image_url]"
    end
  end
end
