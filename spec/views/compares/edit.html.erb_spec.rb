require 'spec_helper'

describe "compares/edit.html.erb" do
  before(:each) do
    @compare = assign(:compare, stub_model(Compare,
      :title => "MyString"
    ))
  end

  it "renders the edit compare form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => compares_path(@compare), :method => "post" do
      assert_select "input#compare_title", :name => "compare[title]"
    end
  end
end
