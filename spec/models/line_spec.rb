require 'spec_helper'

describe Line do

  before(:each) do
    @user = Factory(:user)
    @attr = { :content => "lorem ipsum" }

      @attr_valid =  {:user_id => @user.id,  :content => "lorem ipsum" }
  end

  it "should create a new instance with valid attributes" do
    #@user.lines.create!(@attr)
    #Line.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @line = @user.lines.create(@attr)

      #@attr =  {:user_id => @user.id,  :content => "lorem ipsum" }
      #@line = Line.create(@attr)
    end

    it "should have a user attribute" do
      #@line.should respond_to(:user)
    end

    it "should have the right associated user" do
      @line.user_id.should == @user.id
      #  @line.user.should == @user
    end
  end

  describe "validations" do

    it "should have a user id" do
      Line.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do

      #@user.lines.build(:content => "    ").should_not be_valid
      Line.new(:content => "    ").should_not be_valid
    end

    it "should reject long content" do

      #@user.lines.build(:content => "a" * 1001).should_not be_valid
      Line.new(:content => "a" * 1001).should_not be_valid
    end
  end

  describe "user line has children" do
    it 'add child' do 
      
@line1 =       Line.create!(@attr_valid)
@line2 = Line.create!(:parent_id => @line1.id , :user_id => 2 , :content => "there was a ")
@line1.children.size.should == 1
    end


  end

end
