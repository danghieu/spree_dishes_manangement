require 'rails_helper'

RSpec.describe "nutritions/edit", type: :view do
  before(:each) do
    @nutrition = assign(:nutrition, Nutrition.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit nutrition form" do
    render

    assert_select "form[action=?][method=?]", nutrition_path(@nutrition), "post" do

      assert_select "input#nutrition_name[name=?]", "nutrition[name]"

      assert_select "textarea#nutrition_description[name=?]", "nutrition[description]"
    end
  end
end
