require 'spec_helper'

describe LinesController do
  render_views
  describe "GET index" do
    it "contains the widgets header" do
      get :index 
      response.should have_selector("h1", :content => "Widgets")

    end
    end

  describe "access control" do
    it "should deny access to 'create'" do
      #post :create
     #response.should == ''
#redirect_to(new_line_path)
    end
    
    it "should deny access to 'destroy'" do
      #delete :destroy, :id => 1
      #response.should redirect_to(signin_path)
    end
  end
  
  describe "POST 'create'" do
    
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

       describe "success" do
      
      before(:each) do
        @attr = { :content => "Lorem ipsum dolor sit amet" }
      end
      
      it "should create a line" do
        lambda do
          post :create, :line => @attr
        end.should == ''
# change(Line, :count).by(1)
      end
      
      it "should redirect to the root path" do
        post :create, :line => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash success message" do
        post :create, :line => @attr
        flash[:success].should =~ /line created/i
      end
    end


 describe "failure" do

      before(:each) do
        @attr = { :content => "" }
      end

      it "should not create a line" do
        lambda do
          post :create, :line => @attr
        end.should_not change(Line, :count)
      end
      
      it "should re-render the home page" do
        post :create, :line => @attr
        response.should render_template('pages/home')
      end
    end


  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do
      
      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        @line = Factory(:line, :user => @user)
        test_sign_in(wrong_user)
      end

      it "should deny access" do
        delete :destroy, :id => @line
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      
      before(:each) do
        @user = test_sign_in(Factory(:user))
        @line = Factory(:line, :user => @user)
      end
      
      it "should destroy the line" do
        lambda do
          delete :destroy, :id => @line
          flash[:success].should =~ /deleted/i
          response.should redirect_to(root_path)
        end.should change(Line, :count).by(-1)
      end
    end
  end
end
