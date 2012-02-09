
require 'spec_helper'

describe Assembler do

  before(:each) do
    @user = Factory(:user)
    @attr = { :chapter => "lorem ipsum" }

    @attr_valid =  {:user_id => @user.id,  :chapter => "lorem ipsum" } #for assembler instance
  end

  it "should create a new instance with valid attributes" do
    #@user.assemblers.create!(@attr)
    #Assembler.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @assembler = @user.assemblers.create(@attr)

      #@attr =  {:user_id => @user.id,  :chapter => "lorem ipsum" }
      #@assembler = Assembler.create(@attr)
    end

    it "should have a user attribute" do
      #@assembler.should respond_to(:user)
    end

    it "should have the right associated user" do
      @assembler.user_id.should == @user.id
      #  @assembler.user.should == @user
    end
  end

  describe "validations" do

    it "should have a user id" do
      Assembler.new(@attr).should_not be_valid
    end

    it "should require nonblank chapter" do

      #@user.assemblers.build(:chapter => "    ").should_not be_valid
      Assembler.new(:chapter => "    ").should_not be_valid
    end

    it "should reject long chapter" do

      #@user.assemblers.build(:chapter => "a" * 1001).should_not be_valid
      Assembler.new(:chapter => "a" * 1001).should_not be_valid
    end
  end
  describe "user assembler has children" do
    it 'add child' do 

      @assembler1 =       Assembler.create!(@attr_valid)

      @assembler2 =       Assembler.create!(@attr_valid)
      #@assembler2 = Assembler.create!(:parent_id => @assembler1.id , :user_id => 2 , :chapter => "there was a ")
      @user.assemblers.size.should == 2 

  #    @assembler1.children.size.should == 1
      #    
      #
      #
      
    end


  end

end
# == Schema Information
#
# Table name: assemblers
#
#  id         :integer         not null, primary key
#  chapter      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  note       :text
#

