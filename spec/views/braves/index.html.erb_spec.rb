require 'spec_helper'

describe "braves/index.html.erb" do
  before(:each) do
    assign(:braves, [
      stub_model(Brave,
        :question => "Question",
        :answer => "Answer"
      ),
      stub_model(Brave,
        :question => "Question",
        :answer => "Answer"
      )
    ])
  end

  it "renders a list of braves" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
  end
end
