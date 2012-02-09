
require 'spec_helper'

describe Quize do

  before(:each) do

    @compare = Factory(:compare)


    @attr = { :question => "lorem ipsum" }

    @attr_valid =  {:quizable_type => 'Compare', :quizable_id => @compare.id,  :question => "lorem ipsum" } #for quize instance
  end

  it "should create a new instance with valid attributes" do
    #@compare.quizes.create!(@attr)
    #Quize.create!(@attr)
  end

  describe "compare associations" do

    before(:each) do
      @quize = @compare.quizes.create(@attr)



      #@attr =  {:compare_id => @compare.id,  :question => "lorem ipsum" }
      #@quize = Quize.create(@attr)
    end

    it "should have a compare attribute" do
      #@quize.should respond_to(:compare)
    end

    it "should have the right associated compare" do
      @quize.quizable_type.should == 'Compare'

      @quize.quizable_id.should == @compare.id
      @quize.should be_valid
      #compare_id.should == @compare.id
      #  @quize.compare.should == @compare
    end
  end

  describe "validations" do

    it "should have a compare id" do
      Quize.new(@attr).should_not be_valid
      Quize.new(@attr_valid).should be_valid

    end

    it "should require nonblank question" do

      #@compare.quizes.build(:question => "    ").should_not be_valid
      Quize.new(:question => "    ").should_not be_valid
    end

    it "should reject long question" do

      #@compare.quizes.build(:question => "a" * 1001).should_not be_valid
      Quize.new(:question => "a" * 0).should_not be_valid
    end
  end
  describe "compare quize has children" do
    it 'add child' do 
      @compare.quizes.size.should == 0 
      #   @quize1 =       Quize.new(@attr_valid)
      #
      @quize1 =       @compare.quizes.build(@attr_valid)
      @quize1.should be_valid


      @quize1.save

      #@quize1.should == ''
      @compare.quizes.size.should == 1 
      #  @quize2 =       Quize.new(@attr_valid)

      @quize2 =       @compare.quizes.build(@attr_valid)
      @quize2.save
      #@quize2 = Quize.create!(:parent_id => @quize1.id , :compare_id => 2 , :question => "there was a ")

      @compare.quizes.size.should == 2 

      #    @quize1.children.size.should == 1
      #    
      #
      #

    end
  end

  describe 'assembler quiz had children' do 
    it 'ass' do 
      #@user = Factory(:user)
      
                           @user =  Factory(:user, :email => Factory.next(:email))
      @assembler = Factory(:assembler,:user => @user  )

      #@attr_valid =  {:user_id => @user.id,  :chapter => "lorem ipsum" } #for compare instance

      #@assembler = @user.assemblers.create(@attr)
      # @assembler = Factory(:assembler)
      @attr_valid_asm =  {:quizable_type => 'Assembler', :quizable_id => @assembler.id,  :question => "lorem ipsum" } #for quize instance
      @quize0 = Quize.new @attr_valid_asm
      @quize0.save

      #   @quize_asm = @assembler.quizes.create(@attr)
      @assembler.quizes.size.should == 1 
      @quize =       @assembler.quizes.build @valid_attr_asm
      @quize.save
      @assembler.quizes.size.should == 2 
      @quize =       @assembler.quizes.build @valid_attr_asm
      @quize.save
      @assembler.quizes.size.should == 3 
value = @assembler.quizes.first.quizable_id
type =  @assembler.quizes.first.quizable_type


      res = type.classify.constantize.find(value)
      res.should == @user.assemblers.first 

    end
  end

end
# == Schema Information
#
# Table name: quizes
#
#  id         :integer         not null, primary key
#  question      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  compare_id    :integer
#  note       :text
#

# == Schema Information
#
# Table name: quizes
#
#  id         :integer         not null, primary key
#  question   :string(255)
#  answer     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  quize_id :integer
#

