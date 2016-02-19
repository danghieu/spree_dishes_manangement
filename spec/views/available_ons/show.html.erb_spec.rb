require 'rails_helper'

RSpec.describe "available_ons/show", type: :view do
  before(:each) do
    @available_on = assign(:available_on, AvailableOn.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
