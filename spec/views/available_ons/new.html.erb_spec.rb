require 'rails_helper'

RSpec.describe "available_ons/new", type: :view do
  before(:each) do
    assign(:available_on, AvailableOn.new())
  end

  it "renders new available_on form" do
    render

    assert_select "form[action=?][method=?]", available_ons_path, "post" do
    end
  end
end
