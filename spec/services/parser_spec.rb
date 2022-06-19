require "rails_helper"

RSpec.describe Parser do
  subject(:collection) { described_class.parse_collection(url: collection_url) }
  let(:collection_url) { "http://example.org/collection.json" }
  let(:broken_manifest_url) { "http://example.org/manifest3.json" }

  before do
    WebMock.disable_net_connect!(allow_localhost: true)
    ["collection.json", "manifest1.json", "manifest2.json", "manifest3.json"].each do |fn|
      WebMock.stub_request(:get, "http://example.org/#{fn}")
        .to_return(status: 200, body: File.new("spec/fixtures/#{fn}").read)
    end
  end

  describe "#parse_collection" do
    it "parses the collection metadata" do
      expect(collection.manifest_url).to eq(collection_url)
      expect(collection.label).to eq("Sample Collection")
    end
    it "parses member manifests and images" do
      expect(collection.manifests.size).to eq(2)
      expect(collection.manifests.first.manifest_url).to eq("http://example.org/manifest1.json")
      expect(collection.manifests.first.label).to eq("Manifest 1")
      expect(collection.manifests.first.images.size).to eq(2)
    end
    it "persists the objects" do
      expect(collection).to be_persisted
      expect(collection.manifests.first).to be_persisted
      expect(collection.manifests.first.images.first).to be_persisted
    end

    context "when there is no iiif service" do
      it "skips the image" do
        manifest = described_class.parse_manifest(url: broken_manifest_url)
        expect(manifest.images.size).to eq(0)
      end
    end
  end
end
