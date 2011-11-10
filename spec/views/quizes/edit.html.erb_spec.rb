require 'spec_helper'

describe "quizes/edit.html.erb" do
  before(:each) do
    @quize = assign(:quize, stub_model(Quize,
      :question => "MyString",
      :answer => "MyString"
    ))
  end

  it "renders the edit quize form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quizes_path(@quize), :method => "post" do
      assert_select "input#quize_question", :name => "quize[question]"
      assert_select "input#quize_answer", :name => "quize[answer]"
    end
  end
end
