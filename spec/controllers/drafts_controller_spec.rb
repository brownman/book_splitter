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

describe DraftsController do

  # This should return the minimal set of attributes required to create a valid
  # Draft. As you add validations to Draft, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all drafts as @drafts" do
      draft = Draft.create! valid_attributes
      get :index
      assigns(:drafts).should eq([draft])
    end
  end

  describe "GET show" do
    it "assigns the requested draft as @draft" do
      draft = Draft.create! valid_attributes
      get :show, :id => draft.id.to_s
      assigns(:draft).should eq(draft)
    end
  end

  describe "GET new" do
    it "assigns a new draft as @draft" do
      get :new
      assigns(:draft).should be_a_new(Draft)
    end
  end

  describe "GET edit" do
    it "assigns the requested draft as @draft" do
      draft = Draft.create! valid_attributes
      get :edit, :id => draft.id.to_s
      assigns(:draft).should eq(draft)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Draft" do
        expect {
          post :create, :draft => valid_attributes
        }.to change(Draft, :count).by(1)
      end

      it "assigns a newly created draft as @draft" do
        post :create, :draft => valid_attributes
        assigns(:draft).should be_a(Draft)
        assigns(:draft).should be_persisted
      end

      it "redirects to the created draft" do
        post :create, :draft => valid_attributes
        response.should redirect_to(Draft.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved draft as @draft" do
        # Trigger the behavior that occurs when invalid params are submitted
        Draft.any_instance.stub(:save).and_return(false)
        post :create, :draft => {}
        assigns(:draft).should be_a_new(Draft)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Draft.any_instance.stub(:save).and_return(false)
        post :create, :draft => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested draft" do
        draft = Draft.create! valid_attributes
        # Assuming there are no other drafts in the database, this
        # specifies that the Draft created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Draft.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => draft.id, :draft => {'these' => 'params'}
      end

      it "assigns the requested draft as @draft" do
        draft = Draft.create! valid_attributes
        put :update, :id => draft.id, :draft => valid_attributes
        assigns(:draft).should eq(draft)
      end

      it "redirects to the draft" do
        draft = Draft.create! valid_attributes
        put :update, :id => draft.id, :draft => valid_attributes
        response.should redirect_to(draft)
      end
    end

    describe "with invalid params" do
      it "assigns the draft as @draft" do
        draft = Draft.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Draft.any_instance.stub(:save).and_return(false)
        put :update, :id => draft.id.to_s, :draft => {}
        assigns(:draft).should eq(draft)
      end

      it "re-renders the 'edit' template" do
        draft = Draft.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Draft.any_instance.stub(:save).and_return(false)
        put :update, :id => draft.id.to_s, :draft => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested draft" do
      draft = Draft.create! valid_attributes
      expect {
        delete :destroy, :id => draft.id.to_s
      }.to change(Draft, :count).by(-1)
    end

    it "redirects to the drafts list" do
      draft = Draft.create! valid_attributes
      delete :destroy, :id => draft.id.to_s
      response.should redirect_to(drafts_url)
    end
  end

end
