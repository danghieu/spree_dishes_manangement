require 'rails_helper'

RSpec.describe "rules/show", type: :view do
  before(:each) do
    @rule = assign(:rule, Rule.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
