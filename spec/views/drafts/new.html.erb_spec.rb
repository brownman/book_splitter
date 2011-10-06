require 'spec_helper'

describe "drafts/new.html.erb" do
  before(:each) do
    assign(:draft, stub_model(Draft,
      :content => "MyText",
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new draft form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => drafts_path, :method => "post" do
      assert_select "textarea#draft_content", :name => "draft[content]"
      assert_select "input#draft_title", :name => "draft[title]"
    end
  end
end
