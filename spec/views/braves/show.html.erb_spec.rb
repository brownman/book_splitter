require 'spec_helper'

describe "braves/show.html.erb" do
  before(:each) do
    @brave = assign(:brave, stub_model(Brave,
      :question => "Question",
      :answer => "Answer"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Question/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Answer/)
  end
end
