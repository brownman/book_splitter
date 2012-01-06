require 'spec_helper'

describe "hunters/show.html.erb" do
  before(:each) do
    @hunter = assign(:hunter, stub_model(Hunter,
      :regexp => "Regexp",
      :user_id => 1,
      :result => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Regexp/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
