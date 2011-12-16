require 'spec_helper'

describe MessagesController do
  render_views

  describe "access control" do
    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end
    
    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end
  
  describe "POST 'create'" do
    
    before(:each) do
      @user = test_sign_in(Factory(:user))
@user.should_not ==  nil
    end

    describe "failure" do

      before(:each) do
        @attr = { :line_id => "" }
      end

      it "should not create a message" do
        lambda do
          post :create, :message => @attr
        end.should_not change(Message, :count)
      end
      
      it "should re-render the home page" do
        post :create, :message => @attr
        response.should render_template('messages/new')
      end
    end

    describe "success" do
      
      before(:each) do
        @attr = { :line_id => "Lorem ipsum dolor sit amet" }
      end
      
      it "should create a message" do
        lambda do
          post :create, :message => @attr
        end.should change(Message, :count).by(1)
      end
      
      it "should redirect to the root path" do
        post :create, :message => @attr
        response.should redirect_to messages_path
                                    #(:user_id => @user))
      end

      it "should have a flash success message" do
        post :create, :message => @attr
        flash[:success].should =~ /message created/i
      end
    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do
      
      before(:each) do
        @user = Factory(:user)
#@line = @user.lines.create!(:content => "first line")

#@line.should == nil

        wrong_user = Factory(:user, :email => Factory.next(:email))
#@line2 = wrong_user.lines.create!(:parent_id => @line.id , :content => "second line")
#@line.should -- nil
#wrong_user.class.should == nil
        @message = Factory(:message, :user => @user)
        test_sign_in(wrong_user)
      end

      it "should deny access" do
        delete :destroy, :id => @message
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      
      before(:each) do
        @user = test_sign_in(Factory(:user))
        
        @user.should_not == nil
        @message = Factory(:message, :user_id => @user)
        #@message.should == nil
      end
      
      it "should destroy the message" do
        lambda do
          delete :destroy, :id => @message
          flash[:success].should =~ /deleted/i
          response.should redirect_to(messages_path)
        end.should change(Message, :count).by(-1)
      end
    end
  end
end
