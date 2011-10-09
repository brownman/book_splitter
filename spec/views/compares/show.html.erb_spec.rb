require 'spec_helper'

describe "compares/show.html.erb" do
  before(:each) do
    @compare = assign(:compare, stub_model(Compare,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
