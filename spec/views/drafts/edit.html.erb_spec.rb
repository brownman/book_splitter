require 'spec_helper'

describe "drafts/edit.html.erb" do
  before(:each) do
    @draft = assign(:draft, stub_model(Draft,
      :content => "MyText",
      :title => "MyString"
    ))
  end

  it "renders the edit draft form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => drafts_path(@draft), :method => "post" do
      assert_select "textarea#draft_content", :name => "draft[content]"
      assert_select "input#draft_title", :name => "draft[title]"
    end
  end
end
