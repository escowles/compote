require "rails_helper"

RSpec.describe CollectionsController, type: :controller do
  let(:manifest_url) { "http://example.org/1/manifest" }
  let(:collection) { Collection.create(valid_params) }
  let(:invalid_params) { { label: "Invalid Collection", manifest_url: nil } }
  let(:valid_params) { { label: "Test Collection", manifest_url: manifest_url } }
  let(:updated_params) { { label: "New Label" } }

  describe "GET #index" do
    it "is successful" do
      collection
      get :index, params: {}
      expect(response).to be_successful
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

  describe "DELETE #destroy" do
    it "deletes the collection" do
      col = collection
      expect do
        delete :destroy, params: { id: col.to_param }
      end.to change(Collection, :count).by(-1)
    end
  end
end
