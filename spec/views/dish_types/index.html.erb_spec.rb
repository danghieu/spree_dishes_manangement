require 'rails_helper'

RSpec.describe "dish_types/index", type: :view do
  before(:each) do
    assign(:dish_types, [
      DishType.create!(
        :name => "MyText"
      ),
      DishType.create!(
        :name => "MyText"
      )
    ])
  end

  it "renders a list of dish_types" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
