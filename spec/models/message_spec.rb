require 'spec_helper'

describe Message do

  before(:each) do
    @user = Factory(:user)
    @attr = { :line_id => "1" }

      @attr_valid =  {:user_id => @user.id,  :line_id => "1" }
  end

  it "should create a new instance with valid attributes" do
    #@user.messages.create!(@attr)
    #Message.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @message = @user.messages.create(@attr)

      #@attr1 =  {:user_id => @user.id,  :line_id => "11" }
      #@line1 = Line.create(@attr1)

      #@attr2 =  {:user_id => 2,  :line_id => "12" , :parent_id => @line1.id}

      #@line2 = Line.create(@attr2)

#@user.messages.should == 1
    end

    it "should have a user attribute" do
      #@message.should respond_to(:user)

    end

    it "should have the right associated user" do
      @message.user_id.should == @user.id
      #  @message.user.should == @user
    end
  end
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  line_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

