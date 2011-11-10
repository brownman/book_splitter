require 'spec_helper'

describe "priorities/show.html.erb" do
  before(:each) do
    @priority = assign(:priority, stub_model(Priority,
      :todo => "Todo",
      :target => "Target",
      :conclusion => "Conclusion"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Todo/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Target/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Conclusion/)
  end
end
