require 'spec_helper'

describe "hunters/new.html.erb" do
  before(:each) do
    assign(:hunter, stub_model(Hunter,
      :regexp => "MyString",
      :user_id => 1,
      :result => "MyText"
    ).as_new_record)
  end

  it "renders new hunter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hunters_path, :method => "post" do
      assert_select "input#hunter_regexp", :name => "hunter[regexp]"
      assert_select "input#hunter_user_id", :name => "hunter[user_id]"
      assert_select "textarea#hunter_result", :name => "hunter[result]"
    end
  end
end
