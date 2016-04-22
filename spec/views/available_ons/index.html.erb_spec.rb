require 'rails_helper'

RSpec.describe "available_ons/index", type: :view do
  before(:each) do
    assign(:available_ons, [
      AvailableOn.create!(),
      AvailableOn.create!()
    ])
  end

  it "renders a list of available_ons" do
    render
  end
end
