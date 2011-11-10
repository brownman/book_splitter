require 'spec_helper'

describe "priorities/new.html.erb" do
  before(:each) do
    assign(:priority, stub_model(Priority,
      :todo => "MyString",
      :target => "MyString",
      :conclusion => "MyString"
    ).as_new_record)
  end

  it "renders new priority form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => priorities_path, :method => "post" do
      assert_select "input#priority_todo", :name => "priority[todo]"
      assert_select "input#priority_target", :name => "priority[target]"
      assert_select "input#priority_conclusion", :name => "priority[conclusion]"
    end
  end
end
