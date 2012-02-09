require 'spec_helper'

describe Compare do

  before(:each) do
    @user = Factory(:user)
    @attr = { :title => "lorem ipsum" }

    @attr_valid =  {:user_id => @user.id,  :title => "lorem ipsum" } #for compare instance
  end

  it "should create a new instance with valid attributes" do
    #@user.compares.create!(@attr)
    #Compare.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @compare = @user.compares.create(@attr)

      #@attr =  {:user_id => @user.id,  :title => "lorem ipsum" }
      #@compare = Compare.create(@attr)
    end

    it "should have a user attribute" do
      #@compare.should respond_to(:user)
    end

    it "should have the right associated user" do
      @compare.user_id.should == @user.id
      #  @compare.user.should == @user
    end
  end

  describe "validations" do

    it "should have a user id" do
      Compare.new(@attr).should_not be_valid
    end

    it "should require nonblank title" do

      #@user.compares.build(:title => "    ").should_not be_valid
      Compare.new(:title => "    ").should_not be_valid
    end

    it "should reject long title" do

      #@user.compares.build(:title => "a" * 1001).should_not be_valid
      Compare.new(:title => "a" * 1001).should_not be_valid
    end
  end
  describe "user compare has children" do
    it 'add child' do 

      @compare1 =       Compare.create!(@attr_valid)

      @compare2 =       Compare.create!(@attr_valid)
      #@compare2 = Compare.create!(:parent_id => @compare1.id , :user_id => 2 , :title => "there was a ")
      @user.compares.size.should == 2 

  #    @compare1.children.size.should == 1
      #    
      #
      #
      
    end


  end

end
# == Schema Information
#
# Table name: compares
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  note       :text
#

