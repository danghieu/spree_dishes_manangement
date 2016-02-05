require 'rails_helper'

RSpec.describe "nutritions/show", type: :view do
  before(:each) do
    @nutrition = assign(:nutrition, Nutrition.create!(
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
