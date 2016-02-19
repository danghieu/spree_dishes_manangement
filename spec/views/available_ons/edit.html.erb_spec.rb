require 'rails_helper'

RSpec.describe "available_ons/edit", type: :view do
  before(:each) do
    @available_on = assign(:available_on, AvailableOn.create!())
  end

  it "renders the edit available_on form" do
    render

    assert_select "form[action=?][method=?]", available_on_path(@available_on), "post" do
    end
  end
end
