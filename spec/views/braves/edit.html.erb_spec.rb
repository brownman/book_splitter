require 'spec_helper'

describe "braves/edit.html.erb" do
  before(:each) do
    @brave = assign(:brave, stub_model(Brave,
      :question => "MyString",
      :answer => "MyString"
    ))
  end

  it "renders the edit brave form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => braves_path(@brave), :method => "post" do
      assert_select "input#brave_question", :name => "brave[question]"
      assert_select "input#brave_answer", :name => "brave[answer]"
    end
  end
end
