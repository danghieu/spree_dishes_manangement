require 'rails_helper'

RSpec.describe "rules/new", type: :view do
  before(:each) do
    assign(:rule, Rule.new())
  end

  it "renders new rule form" do
    render

    assert_select "form[action=?][method=?]", rules_path, "post" do
    end
  end
end
