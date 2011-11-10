require 'spec_helper'

describe "todos/index.html.erb" do
  before(:each) do
    assign(:todos, [
      stub_model(Todo,
        :action => "Action",
        :target => "Target",
        :conclusion => "Conclusion"
      ),
      stub_model(Todo,
        :action => "Action",
        :target => "Target",
        :conclusion => "Conclusion"
      )
    ])
  end

  it "renders a list of todos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Action".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Target".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Conclusion".to_s, :count => 2
  end
end
