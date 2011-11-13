require 'spec_helper'

describe "quizes/index.html.erb" do
  before(:each) do
    assign(:quizes, [
      stub_model(Quize,
        :question => "Question",
        :answer => "Answer"
      ),
      stub_model(Quize,
        :question => "Question",
        :answer => "Answer"
      )
    ])
  end

  it "renders a list of quizes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
  end
end