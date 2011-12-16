require 'spec_helper'

describe SmartsController do
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
        @attr = { :question => "" }
      end

      it "should not create a smart" do
        lambda do
          post :create, :smart => @attr
        end.should_not change(Smart, :count)
      end
      
      it "should re-render the home page" do
        post :create, :smart => @attr
        response.should render_template('smarts/new')
      end
    end

    describe "success" do
      
      before(:each) do
        @attr = { :question => "Lorem ipsum dolor sit amet" }
      end
      
      it "should create a smart" do
        lambda do
          post :create, :smart => @attr
        end.should change(Smart, :count).by(1)
      end
      
      it "should redirect to the root path" do
        post :create, :smart => @attr
        response.should redirect_to smarts_path
                                    #(:user_id => @user))
      end

      it "should have a flash success message" do
        post :create, :smart => @attr
        flash[:success].should =~ /smart created/i
      end
    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do
      
      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        @smart = Factory(:smart, :user => @user)
        test_sign_in(wrong_user)
      end

      it "should deny access" do
        delete :destroy, :id => @smart
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      
      before(:each) do
        @user = test_sign_in(Factory(:user))
        
        @user.should_not == nil
        @smart = Factory(:smart, :user_id => @user)
        #@smart.should == nil
      end
      
      it "should destroy the smart" do
        lambda do
          delete :destroy, :id => @smart
          flash[:success].should =~ /deleted/i
          response.should redirect_to(smarts_path)
        end.should change(Smart, :count).by(-1)
      end
    end
  end
end
