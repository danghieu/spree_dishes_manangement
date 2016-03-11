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

RSpec.describe DishTypeImagesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # DishTypeImage. As you add validations to DishTypeImage, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DishTypeImagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all dish_type_images as @dish_type_images" do
      dish_type_image = DishTypeImage.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:dish_type_images)).to eq([dish_type_image])
    end
  end

  describe "GET #show" do
    it "assigns the requested dish_type_image as @dish_type_image" do
      dish_type_image = DishTypeImage.create! valid_attributes
      get :show, {:id => dish_type_image.to_param}, valid_session
      expect(assigns(:dish_type_image)).to eq(dish_type_image)
    end
  end

  describe "GET #new" do
    it "assigns a new dish_type_image as @dish_type_image" do
      get :new, {}, valid_session
      expect(assigns(:dish_type_image)).to be_a_new(DishTypeImage)
    end
  end

  describe "GET #edit" do
    it "assigns the requested dish_type_image as @dish_type_image" do
      dish_type_image = DishTypeImage.create! valid_attributes
      get :edit, {:id => dish_type_image.to_param}, valid_session
      expect(assigns(:dish_type_image)).to eq(dish_type_image)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new DishTypeImage" do
        expect {
          post :create, {:dish_type_image => valid_attributes}, valid_session
        }.to change(DishTypeImage, :count).by(1)
      end

      it "assigns a newly created dish_type_image as @dish_type_image" do
        post :create, {:dish_type_image => valid_attributes}, valid_session
        expect(assigns(:dish_type_image)).to be_a(DishTypeImage)
        expect(assigns(:dish_type_image)).to be_persisted
      end

      it "redirects to the created dish_type_image" do
        post :create, {:dish_type_image => valid_attributes}, valid_session
        expect(response).to redirect_to(DishTypeImage.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved dish_type_image as @dish_type_image" do
        post :create, {:dish_type_image => invalid_attributes}, valid_session
        expect(assigns(:dish_type_image)).to be_a_new(DishTypeImage)
      end

      it "re-renders the 'new' template" do
        post :create, {:dish_type_image => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested dish_type_image" do
        dish_type_image = DishTypeImage.create! valid_attributes
        put :update, {:id => dish_type_image.to_param, :dish_type_image => new_attributes}, valid_session
        dish_type_image.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested dish_type_image as @dish_type_image" do
        dish_type_image = DishTypeImage.create! valid_attributes
        put :update, {:id => dish_type_image.to_param, :dish_type_image => valid_attributes}, valid_session
        expect(assigns(:dish_type_image)).to eq(dish_type_image)
      end

      it "redirects to the dish_type_image" do
        dish_type_image = DishTypeImage.create! valid_attributes
        put :update, {:id => dish_type_image.to_param, :dish_type_image => valid_attributes}, valid_session
        expect(response).to redirect_to(dish_type_image)
      end
    end

    context "with invalid params" do
      it "assigns the dish_type_image as @dish_type_image" do
        dish_type_image = DishTypeImage.create! valid_attributes
        put :update, {:id => dish_type_image.to_param, :dish_type_image => invalid_attributes}, valid_session
        expect(assigns(:dish_type_image)).to eq(dish_type_image)
      end

      it "re-renders the 'edit' template" do
        dish_type_image = DishTypeImage.create! valid_attributes
        put :update, {:id => dish_type_image.to_param, :dish_type_image => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested dish_type_image" do
      dish_type_image = DishTypeImage.create! valid_attributes
      expect {
        delete :destroy, {:id => dish_type_image.to_param}, valid_session
      }.to change(DishTypeImage, :count).by(-1)
    end

    it "redirects to the dish_type_images list" do
      dish_type_image = DishTypeImage.create! valid_attributes
      delete :destroy, {:id => dish_type_image.to_param}, valid_session
      expect(response).to redirect_to(dish_type_images_url)
    end
  end

end
