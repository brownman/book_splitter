require 'spec_helper'

describe "todos/show.html.erb" do
  before(:each) do
    @todo = assign(:todo, stub_model(Todo,
      :action => "Action",
      :target => "Target",
      :conclusion => "Conclusion"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Action/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Target/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Conclusion/)
  end
end
