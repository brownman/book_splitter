require 'spec_helper'

describe "priorities/index.html.erb" do
  before(:each) do
    assign(:priorities, [
      stub_model(Priority,
        :todo => "Todo",
        :target => "Target",
        :conclusion => "Conclusion"
      ),
      stub_model(Priority,
        :todo => "Todo",
        :target => "Target",
        :conclusion => "Conclusion"
      )
    ])
  end

  it "renders a list of priorities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Todo".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Target".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Conclusion".to_s, :count => 2
  end
end
