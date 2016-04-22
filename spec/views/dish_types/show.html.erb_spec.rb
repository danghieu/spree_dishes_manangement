require 'rails_helper'

RSpec.describe "dish_types/show", type: :view do
  before(:each) do
    @dish_type = assign(:dish_type, DishType.create!(
      :name => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
