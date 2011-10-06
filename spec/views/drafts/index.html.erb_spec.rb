require 'spec_helper'

describe "drafts/index.html.erb" do
  before(:each) do
    assign(:drafts, [
      stub_model(Draft,
        :content => "MyText",
        :title => "Title"
      ),
      stub_model(Draft,
        :content => "MyText",
        :title => "Title"
      )
    ])
  end

  it "renders a list of drafts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
