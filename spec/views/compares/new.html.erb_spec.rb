require 'spec_helper'

describe "compares/new.html.erb" do
  before(:each) do
    assign(:compare, stub_model(Compare,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new compare form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => compares_path, :method => "post" do
      assert_select "input#compare_title", :name => "compare[title]"
    end
  end
end
