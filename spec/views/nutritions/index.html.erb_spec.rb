require 'rails_helper'

RSpec.describe "nutritions/index", type: :view do
  before(:each) do
    assign(:nutritions, [
      Nutrition.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Nutrition.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of nutritions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
