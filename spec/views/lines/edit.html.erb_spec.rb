require 'spec_helper'

describe "lines/edit.html.erb" do
  before(:each) do
    @line = assign(:line, stub_model(Line,
      :content => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit line form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lines_path(@line), :method => "post" do
      assert_select "input#line_content", :name => "line[content]"
      assert_select "input#line_user_id", :name => "line[user_id]"
    end
  end
end
