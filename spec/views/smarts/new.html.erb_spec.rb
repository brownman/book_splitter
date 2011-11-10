require 'spec_helper'

describe "smarts/new.html.erb" do
  before(:each) do
    assign(:smart, stub_model(Smart,
      :question => "MyString",
      :answer => "MyString"
    ).as_new_record)
  end

  it "renders new smart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => smarts_path, :method => "post" do
      assert_select "input#smart_question", :name => "smart[question]"
      assert_select "input#smart_answer", :name => "smart[answer]"
    end
  end
end
