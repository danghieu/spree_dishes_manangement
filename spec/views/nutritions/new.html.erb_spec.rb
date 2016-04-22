require 'rails_helper'

RSpec.describe "nutritions/new", type: :view do
  before(:each) do
    assign(:nutrition, Nutrition.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new nutrition form" do
    render

    assert_select "form[action=?][method=?]", nutritions_path, "post" do

      assert_select "input#nutrition_name[name=?]", "nutrition[name]"

      assert_select "textarea#nutrition_description[name=?]", "nutrition[description]"
    end
  end
end
