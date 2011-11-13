require 'spec_helper'

describe "ideas/new.html.erb" do
  before(:each) do
    assign(:idea, stub_model(Idea,
      :title => "MyString",
      :content => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new idea form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ideas_path, :method => "post" do
      assert_select "input#idea_title", :name => "idea[title]"
      assert_select "textarea#idea_content", :name => "idea[content]"
      assert_select "input#idea_user_id", :name => "idea[user_id]"
    end
  end
end
