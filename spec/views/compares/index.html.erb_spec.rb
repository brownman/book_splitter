require 'spec_helper'

describe "compares/index.html.erb" do
  before(:each) do
    assign(:compares, [
      stub_model(Compare,
        :title => "Title"
      ),
      stub_model(Compare,
        :title => "Title"
      )
    ])
  end

  it "renders a list of compares" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
