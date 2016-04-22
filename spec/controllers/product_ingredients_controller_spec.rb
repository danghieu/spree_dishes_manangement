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

RSpec.describe ProductIngredientsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ProductIngredient. As you add validations to ProductIngredient, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductIngredientsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all product_ingredients as @product_ingredients" do
      product_ingredient = ProductIngredient.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:product_ingredients)).to eq([product_ingredient])
    end
  end

  describe "GET #show" do
    it "assigns the requested product_ingredient as @product_ingredient" do
      product_ingredient = ProductIngredient.create! valid_attributes
      get :show, {:id => product_ingredient.to_param}, valid_session
      expect(assigns(:product_ingredient)).to eq(product_ingredient)
    end
  end

  describe "GET #new" do
    it "assigns a new product_ingredient as @product_ingredient" do
      get :new, {}, valid_session
      expect(assigns(:product_ingredient)).to be_a_new(ProductIngredient)
    end
  end

  describe "GET #edit" do
    it "assigns the requested product_ingredient as @product_ingredient" do
      product_ingredient = ProductIngredient.create! valid_attributes
      get :edit, {:id => product_ingredient.to_param}, valid_session
      expect(assigns(:product_ingredient)).to eq(product_ingredient)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ProductIngredient" do
        expect {
          post :create, {:product_ingredient => valid_attributes}, valid_session
        }.to change(ProductIngredient, :count).by(1)
      end

      it "assigns a newly created product_ingredient as @product_ingredient" do
        post :create, {:product_ingredient => valid_attributes}, valid_session
        expect(assigns(:product_ingredient)).to be_a(ProductIngredient)
        expect(assigns(:product_ingredient)).to be_persisted
      end

      it "redirects to the created product_ingredient" do
        post :create, {:product_ingredient => valid_attributes}, valid_session
        expect(response).to redirect_to(ProductIngredient.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved product_ingredient as @product_ingredient" do
        post :create, {:product_ingredient => invalid_attributes}, valid_session
        expect(assigns(:product_ingredient)).to be_a_new(ProductIngredient)
      end

      it "re-renders the 'new' template" do
        post :create, {:product_ingredient => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested product_ingredient" do
        product_ingredient = ProductIngredient.create! valid_attributes
        put :update, {:id => product_ingredient.to_param, :product_ingredient => new_attributes}, valid_session
        product_ingredient.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested product_ingredient as @product_ingredient" do
        product_ingredient = ProductIngredient.create! valid_attributes
        put :update, {:id => product_ingredient.to_param, :product_ingredient => valid_attributes}, valid_session
        expect(assigns(:product_ingredient)).to eq(product_ingredient)
      end

      it "redirects to the product_ingredient" do
        product_ingredient = ProductIngredient.create! valid_attributes
        put :update, {:id => product_ingredient.to_param, :product_ingredient => valid_attributes}, valid_session
        expect(response).to redirect_to(product_ingredient)
      end
    end

    context "with invalid params" do
      it "assigns the product_ingredient as @product_ingredient" do
        product_ingredient = ProductIngredient.create! valid_attributes
        put :update, {:id => product_ingredient.to_param, :product_ingredient => invalid_attributes}, valid_session
        expect(assigns(:product_ingredient)).to eq(product_ingredient)
      end

      it "re-renders the 'edit' template" do
        product_ingredient = ProductIngredient.create! valid_attributes
        put :update, {:id => product_ingredient.to_param, :product_ingredient => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product_ingredient" do
      product_ingredient = ProductIngredient.create! valid_attributes
      expect {
        delete :destroy, {:id => product_ingredient.to_param}, valid_session
      }.to change(ProductIngredient, :count).by(-1)
    end

    it "redirects to the product_ingredients list" do
      product_ingredient = ProductIngredient.create! valid_attributes
      delete :destroy, {:id => product_ingredient.to_param}, valid_session
      expect(response).to redirect_to(product_ingredients_url)
    end
  end

end
