require 'spec_helper'

describe IdeasController do
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
        @attr = { :content => "" }
      end

      it "should not create a idea" do
        lambda do
          post :create, :idea => @attr
        end.should_not change(Idea, :count)
      end
      
      it "should re-render the home page" do
        post :create, :idea => @attr
        response.should render_template('ideas/new')
      end
    end

    describe "success" do
      
      before(:each) do
        @attr = { :content => "Lorem ipsum dolor sit amet" }
      end
      
      it "should create a idea" do
        lambda do
          post :create, :idea => @attr
        end.should change(Idea, :count).by(1)
      end
      
      it "should redirect to the root path" do
        post :create, :idea => @attr
        response.should redirect_to ideas_path
                                    #(:user_id => @user))
      end

      it "should have a flash success message" do
        post :create, :idea => @attr
        flash[:success].should =~ /idea created/i
      end
    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do
      
      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        @idea = Factory(:idea, :user => @user)
        test_sign_in(wrong_user)
      end

      it "should deny access" do
        delete :destroy, :id => @idea
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      
      before(:each) do
        @user = test_sign_in(Factory(:user))
        
        @user.should_not == nil
        @idea = Factory(:idea, :user_id => @user)
        #@idea.should == nil
      end
      
      it "should destroy the idea" do
        lambda do
          delete :destroy, :id => @idea
          flash[:success].should =~ /deleted/i
          response.should redirect_to(ideas_path)
        end.should change(Idea, :count).by(-1)
      end
    end
  end
end
