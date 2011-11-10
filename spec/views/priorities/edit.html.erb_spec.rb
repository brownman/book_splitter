require 'spec_helper'

describe "priorities/edit.html.erb" do
  before(:each) do
    @priority = assign(:priority, stub_model(Priority,
      :todo => "MyString",
      :target => "MyString",
      :conclusion => "MyString"
    ))
  end

  it "renders the edit priority form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => priorities_path(@priority), :method => "post" do
      assert_select "input#priority_todo", :name => "priority[todo]"
      assert_select "input#priority_target", :name => "priority[target]"
      assert_select "input#priority_conclusion", :name => "priority[conclusion]"
    end
  end
end
