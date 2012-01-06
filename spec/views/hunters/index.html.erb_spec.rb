require 'spec_helper'

describe "hunters/index.html.erb" do
  before(:each) do
    assign(:hunters, [
      stub_model(Hunter,
        :regexp => "Regexp",
        :user_id => 1,
        :result => "MyText"
      ),
      stub_model(Hunter,
        :regexp => "Regexp",
        :user_id => 1,
        :result => "MyText"
      )
    ])
  end

  it "renders a list of hunters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Regexp".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
