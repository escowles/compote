RSpec.describe CollectionsHelper do
  subject(:helper) { described_class }
  let(:img_base) { "https://example.org/images/1" }

  describe "#iiif_image_tag" do
    it "generates a iiif image url" do
      img = iiif_image_tag img_base, 123
      expect(img.to_s).to include("#{img_base}/full/123,/0/default.jpg")
    end
  end
end
