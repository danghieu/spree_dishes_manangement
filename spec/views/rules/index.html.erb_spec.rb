require 'rails_helper'

RSpec.describe "rules/index", type: :view do
  before(:each) do
    assign(:rules, [
      Rule.create!(),
      Rule.create!()
    ])
  end

  it "renders a list of rules" do
    render
  end
end
