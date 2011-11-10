require 'spec_helper'

describe "todos/new.html.erb" do
  before(:each) do
    assign(:todo, stub_model(Todo,
      :action => "MyString",
      :target => "MyString",
      :conclusion => "MyString"
    ).as_new_record)
  end

  it "renders new todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todos_path, :method => "post" do
      assert_select "input#todo_action", :name => "todo[action]"
      assert_select "input#todo_target", :name => "todo[target]"
      assert_select "input#todo_conclusion", :name => "todo[conclusion]"
    end
  end
end
