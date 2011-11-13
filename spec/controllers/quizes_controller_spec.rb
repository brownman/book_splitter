require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe QuizesController do

  # This should return the minimal set of attributes required to create a valid
  # Quize. As you add validations to Quize, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all quizes as @quizes" do
      quize = Quize.create! valid_attributes
      get :index
      assigns(:quizes).should eq([quize])
    end
  end

  describe "GET show" do
    it "assigns the requested quize as @quize" do
      quize = Quize.create! valid_attributes
      get :show, :id => quize.id.to_s
      assigns(:quize).should eq(quize)
    end
  end

  describe "GET new" do
    it "assigns a new quize as @quize" do
      get :new
      assigns(:quize).should be_a_new(Quize)
    end
  end

  describe "GET edit" do
    it "assigns the requested quize as @quize" do
      quize = Quize.create! valid_attributes
      get :edit, :id => quize.id.to_s
      assigns(:quize).should eq(quize)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Quize" do
        expect {
          post :create, :quize => valid_attributes
        }.to change(Quize, :count).by(1)
      end

      it "assigns a newly created quize as @quize" do
        post :create, :quize => valid_attributes
        assigns(:quize).should be_a(Quize)
        assigns(:quize).should be_persisted
      end

      it "redirects to the created quize" do
        post :create, :quize => valid_attributes
        response.should redirect_to(Quize.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved quize as @quize" do
        # Trigger the behavior that occurs when invalid params are submitted
        Quize.any_instance.stub(:save).and_return(false)
        post :create, :quize => {}
        assigns(:quize).should be_a_new(Quize)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Quize.any_instance.stub(:save).and_return(false)
        post :create, :quize => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested quize" do
        quize = Quize.create! valid_attributes
        # Assuming there are no other quizes in the database, this
        # specifies that the Quize created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Quize.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => quize.id, :quize => {'these' => 'params'}
      end

      it "assigns the requested quize as @quize" do
        quize = Quize.create! valid_attributes
        put :update, :id => quize.id, :quize => valid_attributes
        assigns(:quize).should eq(quize)
      end

      it "redirects to the quize" do
        quize = Quize.create! valid_attributes
        put :update, :id => quize.id, :quize => valid_attributes
        response.should redirect_to(quize)
      end
    end

    describe "with invalid params" do
      it "assigns the quize as @quize" do
        quize = Quize.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Quize.any_instance.stub(:save).and_return(false)
        put :update, :id => quize.id.to_s, :quize => {}
        assigns(:quize).should eq(quize)
      end

      it "re-renders the 'edit' template" do
        quize = Quize.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Quize.any_instance.stub(:save).and_return(false)
        put :update, :id => quize.id.to_s, :quize => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested quize" do
      quize = Quize.create! valid_attributes
      expect {
        delete :destroy, :id => quize.id.to_s
      }.to change(Quize, :count).by(-1)
    end

    it "redirects to the quizes list" do
      quize = Quize.create! valid_attributes
      delete :destroy, :id => quize.id.to_s
      response.should redirect_to(quizes_url)
    end
  end

end