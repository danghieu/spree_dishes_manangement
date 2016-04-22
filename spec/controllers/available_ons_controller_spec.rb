require 'rails_helper'

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

RSpec.describe AvailableOnsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # AvailableOn. As you add validations to AvailableOn, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AvailableOnsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all available_ons as @available_ons" do
      available_on = AvailableOn.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:available_ons)).to eq([available_on])
    end
  end

  describe "GET #show" do
    it "assigns the requested available_on as @available_on" do
      available_on = AvailableOn.create! valid_attributes
      get :show, {:id => available_on.to_param}, valid_session
      expect(assigns(:available_on)).to eq(available_on)
    end
  end

  describe "GET #new" do
    it "assigns a new available_on as @available_on" do
      get :new, {}, valid_session
      expect(assigns(:available_on)).to be_a_new(AvailableOn)
    end
  end

  describe "GET #edit" do
    it "assigns the requested available_on as @available_on" do
      available_on = AvailableOn.create! valid_attributes
      get :edit, {:id => available_on.to_param}, valid_session
      expect(assigns(:available_on)).to eq(available_on)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new AvailableOn" do
        expect {
          post :create, {:available_on => valid_attributes}, valid_session
        }.to change(AvailableOn, :count).by(1)
      end

      it "assigns a newly created available_on as @available_on" do
        post :create, {:available_on => valid_attributes}, valid_session
        expect(assigns(:available_on)).to be_a(AvailableOn)
        expect(assigns(:available_on)).to be_persisted
      end

      it "redirects to the created available_on" do
        post :create, {:available_on => valid_attributes}, valid_session
        expect(response).to redirect_to(AvailableOn.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved available_on as @available_on" do
        post :create, {:available_on => invalid_attributes}, valid_session
        expect(assigns(:available_on)).to be_a_new(AvailableOn)
      end

      it "re-renders the 'new' template" do
        post :create, {:available_on => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested available_on" do
        available_on = AvailableOn.create! valid_attributes
        put :update, {:id => available_on.to_param, :available_on => new_attributes}, valid_session
        available_on.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested available_on as @available_on" do
        available_on = AvailableOn.create! valid_attributes
        put :update, {:id => available_on.to_param, :available_on => valid_attributes}, valid_session
        expect(assigns(:available_on)).to eq(available_on)
      end

      it "redirects to the available_on" do
        available_on = AvailableOn.create! valid_attributes
        put :update, {:id => available_on.to_param, :available_on => valid_attributes}, valid_session
        expect(response).to redirect_to(available_on)
      end
    end

    context "with invalid params" do
      it "assigns the available_on as @available_on" do
        available_on = AvailableOn.create! valid_attributes
        put :update, {:id => available_on.to_param, :available_on => invalid_attributes}, valid_session
        expect(assigns(:available_on)).to eq(available_on)
      end

      it "re-renders the 'edit' template" do
        available_on = AvailableOn.create! valid_attributes
        put :update, {:id => available_on.to_param, :available_on => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested available_on" do
      available_on = AvailableOn.create! valid_attributes
      expect {
        delete :destroy, {:id => available_on.to_param}, valid_session
      }.to change(AvailableOn, :count).by(-1)
    end

    it "redirects to the available_ons list" do
      available_on = AvailableOn.create! valid_attributes
      delete :destroy, {:id => available_on.to_param}, valid_session
      expect(response).to redirect_to(available_ons_url)
    end
  end

end
