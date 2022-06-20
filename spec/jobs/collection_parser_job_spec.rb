require "rails_helper"
require "webmock_helper"

RSpec.describe CollectionParserJob do
  describe "#perform" do
    let(:collection_url) { "http://example.org/collection.json" }

    it "parses the collection and creates objects" do
      expect { described_class.perform_now(collection_url) }
        .to change(Collection, :count).by(1)
    end
  end
end
