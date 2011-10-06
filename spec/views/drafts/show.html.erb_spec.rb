require 'spec_helper'

describe "drafts/show.html.erb" do
  before(:each) do
    @draft = assign(:draft, stub_model(Draft,
      :content => "MyText",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
