require 'spec_helper'

describe ComparesController do
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
        @attr = { :title => "" }
      end

      it "should not create a compare" do
        lambda do
          post :create, :compare => @attr
        end.should_not change(Compare, :count)
      end
      
      it "should re-render the home page" do
        post :create, :compare => @attr
        response.should render_template('compares/new')
      end
    end

    describe "success" do
      
      before(:each) do
        @attr = { :title => "Lorem ipsum dolor sit amet" }
      end
      
      it "should create a compare" do
        lambda do
          post :create, :compare => @attr
        end.should change(Compare, :count).by(1)
      end
      
      it "should redirect to the root path" do
        post :create, :compare => @attr
        response.should redirect_to compares_path
                                    #(:user_id => @user))
      end

      it "should have a flash success message" do
        post :create, :compare => @attr
        flash[:success].should =~ /compare created/i
      end
    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do
      
      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        @compare = Factory(:compare, :user => @user)
        test_sign_in(wrong_user)
      end

      it "should deny access" do
        delete :destroy, :id => @compare
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      
      before(:each) do
        @user = test_sign_in(Factory(:user))
        
        @user.should_not == nil
        @compare = Factory(:compare, :user_id => @user)
        #@compare.should == nil
      end
      
      it "should destroy the compare" do
        lambda do
          delete :destroy, :id => @compare
          flash[:success].should =~ /deleted/i
          response.should redirect_to(compares_path)
        end.should change(Compare, :count).by(-1)
      end
    end
  end
end
