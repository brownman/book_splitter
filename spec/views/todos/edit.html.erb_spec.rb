require 'spec_helper'

describe "todos/edit.html.erb" do
  before(:each) do
    @todo = assign(:todo, stub_model(Todo,
      :action => "MyString",
      :target => "MyString",
      :conclusion => "MyString"
    ))
  end

  it "renders the edit todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todos_path(@todo), :method => "post" do
      assert_select "input#todo_action", :name => "todo[action]"
      assert_select "input#todo_target", :name => "todo[target]"
      assert_select "input#todo_conclusion", :name => "todo[conclusion]"
    end
  end
end
