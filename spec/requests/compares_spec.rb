require 'spec_helper'

describe "Compares" do
  describe "GET /compares" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get compares_path
      response.status.should be(200)
    end
  end
end
