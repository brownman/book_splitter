require 'spec_helper'

describe QuizesController do
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
      @compare = Factory(:compare , :user_id => @user.id , :title => "book A - Chapter 1")
      #@user.should_not ==  nil
    end

    describe "failure" do

      before(:each) do
        @attr = { :question => "", :compare_id => @compare.id }
      end

      it "should not create a quize" do
        lambda do
          post :create, :quize => @attr 
        end.should_not change(Quize, :count)
      end

      it "should re-render the home page" do
        post :create, :quize => @attr
        response.should render_template('quizes/new')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :question => "Lorem ipsum dolor sit amet" , :compare_id => @compare.id }
      end

      it "should create a quize" do
        lambda do
          post :create, :quize => @attr
        end.should change(Quize, :count).by(1)
      end

      it "should redirect to the root path" do
        post :create, :quize => @attr
        response.should redirect_to quizes_path
        #(:user_id => @user))
      end

      it "should have a flash success message" do
        post :create, :quize => @attr
        flash[:success].should =~ /quize created/i
      end

    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
        @compare = Factory(:compare , :user_id => @user.id , :title => "book A - Chapter 1")

        @quize = Factory(:quize, :compare => @compare)
        wrong_user = Factory(:user, :email => Factory.next(:email))

        test_sign_in(wrong_user)


      end

      it "should deny access" do
        delete :destroy, :id => @quize
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user))

        @compare = Factory(:compare , :user_id => @user.id , :title => "book A - Chapter 1")
        #@user.should_not == nil
        @quize = Factory(:quize, :compare_id => @compare.id)
        #@quize.should == nil
      end

      it "should destroy the quize" do
        lambda do
          delete :destroy, :id => @quize
          flash[:success].should =~ /deleted/i
          response.should redirect_to(quizes_path)
        end.should change(Quize, :count).by(-1)
      end
    end
  end
end
