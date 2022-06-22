require "rails_helper"
require "webmock_helper"

RSpec.describe CollectionsController, type: :controller do
  let(:manifest_url) { "http://example.org/collection.json" }
  let(:collection) { Collection.create(valid_params) }
  let(:invalid_params) { { label: "Invalid Collection", manifest_url: nil } }
  let(:valid_params) { { label: "Test Collection", manifest_url: manifest_url } }
  let(:updated_params) { { label: "New Label" } }
  let(:valid_user) { User.create!(email: "test@example.org", password: "xxxxxxxx") }

  before do
    sign_in valid_user
  end

  describe "GET #index" do
    it "is successful" do
      collection
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "assigns variables" do
      collection
      get :show, params: { id: collection.id }
      expect(response).to be_successful
      expect(assigns(:collection).id).to eq(collection.id)
      expect(assigns(:image_size)).to eq(128)
      expect(assigns(:larger_size)).to eq(256)
      expect(assigns(:smaller_size)).to eq(64)
    end
  end

  describe "GET #new" do
    it "displays the form" do
      get :new, params: {}
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a resource" do
        expect do
          post :create, params: { collection: valid_params }
        end.to change(Collection, :count).by(1)
      end
    end
    context "with invalid params" do
      it "errors" do
        expect do
          post :create, params: { collection: invalid_params }
        end.to_not change(Collection, :count)
      end
    end
  end

  describe "PUT #update" do
    before do
      collection
    end
    context "with valid params" do
      it "updates a resource" do
        put :update, params: { id: collection.id, collection: updated_params }
        collection.reload
        expect(collection.label).to eq("New Label")
        expect(collection.manifest_url).to eq(manifest_url)
      end
    end
    context "with invalid params" do
      it "does not update the resource" do
        put :update, params: { id: collection.id, collection: invalid_params }
        collection.reload
        expect(collection.label).to eq("Test Collection")
        expect(collection.manifest_url).to eq(manifest_url)
      end
    end
  end

  describe "POST #parse" do
    it "parses the collection manifest and creates objects" do
      col = collection
      expect(col.manifests.size).to eq(0)
      post :parse, params: { id: col.to_param }

      col.reload
      expect(col.manifests.size).to eq(2)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the collection" do
      col = collection
      expect do
        delete :destroy, params: { id: col.to_param }
      end.to change(Collection, :count).by(-1)
    end
  end
end
