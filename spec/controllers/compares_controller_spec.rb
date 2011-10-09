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

describe ComparesController do

  # This should return the minimal set of attributes required to create a valid
  # Compare. As you add validations to Compare, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all compares as @compares" do
      compare = Compare.create! valid_attributes
      get :index
      assigns(:compares).should eq([compare])
    end
  end

  describe "GET show" do
    it "assigns the requested compare as @compare" do
      compare = Compare.create! valid_attributes
      get :show, :id => compare.id.to_s
      assigns(:compare).should eq(compare)
    end
  end

  describe "GET new" do
    it "assigns a new compare as @compare" do
      get :new
      assigns(:compare).should be_a_new(Compare)
    end
  end

  describe "GET edit" do
    it "assigns the requested compare as @compare" do
      compare = Compare.create! valid_attributes
      get :edit, :id => compare.id.to_s
      assigns(:compare).should eq(compare)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Compare" do
        expect {
          post :create, :compare => valid_attributes
        }.to change(Compare, :count).by(1)
      end

      it "assigns a newly created compare as @compare" do
        post :create, :compare => valid_attributes
        assigns(:compare).should be_a(Compare)
        assigns(:compare).should be_persisted
      end

      it "redirects to the created compare" do
        post :create, :compare => valid_attributes
        response.should redirect_to(Compare.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved compare as @compare" do
        # Trigger the behavior that occurs when invalid params are submitted
        Compare.any_instance.stub(:save).and_return(false)
        post :create, :compare => {}
        assigns(:compare).should be_a_new(Compare)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Compare.any_instance.stub(:save).and_return(false)
        post :create, :compare => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested compare" do
        compare = Compare.create! valid_attributes
        # Assuming there are no other compares in the database, this
        # specifies that the Compare created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Compare.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => compare.id, :compare => {'these' => 'params'}
      end

      it "assigns the requested compare as @compare" do
        compare = Compare.create! valid_attributes
        put :update, :id => compare.id, :compare => valid_attributes
        assigns(:compare).should eq(compare)
      end

      it "redirects to the compare" do
        compare = Compare.create! valid_attributes
        put :update, :id => compare.id, :compare => valid_attributes
        response.should redirect_to(compare)
      end
    end

    describe "with invalid params" do
      it "assigns the compare as @compare" do
        compare = Compare.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Compare.any_instance.stub(:save).and_return(false)
        put :update, :id => compare.id.to_s, :compare => {}
        assigns(:compare).should eq(compare)
      end

      it "re-renders the 'edit' template" do
        compare = Compare.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Compare.any_instance.stub(:save).and_return(false)
        put :update, :id => compare.id.to_s, :compare => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested compare" do
      compare = Compare.create! valid_attributes
      expect {
        delete :destroy, :id => compare.id.to_s
      }.to change(Compare, :count).by(-1)
    end

    it "redirects to the compares list" do
      compare = Compare.create! valid_attributes
      delete :destroy, :id => compare.id.to_s
      response.should redirect_to(compares_url)
    end
  end

end
