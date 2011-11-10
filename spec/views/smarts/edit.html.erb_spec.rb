require 'spec_helper'

describe "smarts/edit.html.erb" do
  before(:each) do
    @smart = assign(:smart, stub_model(Smart,
      :question => "MyString",
      :answer => "MyString"
    ))
  end

  it "renders the edit smart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => smarts_path(@smart), :method => "post" do
      assert_select "input#smart_question", :name => "smart[question]"
      assert_select "input#smart_answer", :name => "smart[answer]"
    end
  end
end
