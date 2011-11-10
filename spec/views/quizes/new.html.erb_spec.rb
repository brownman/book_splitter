require 'spec_helper'

describe "quizes/new.html.erb" do
  before(:each) do
    assign(:quize, stub_model(Quize,
      :question => "MyString",
      :answer => "MyString"
    ).as_new_record)
  end

  it "renders new quize form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quizes_path, :method => "post" do
      assert_select "input#quize_question", :name => "quize[question]"
      assert_select "input#quize_answer", :name => "quize[answer]"
    end
  end
end
