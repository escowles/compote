require "rails_helper"
describe Image do
  let(:image_url) { "http://example.org/1.jpg" }
  subject { described_class.new(image_url: image_url) }

  it "has properties" do
    expect(subject.image_url).to eq(image_url)
  end
end
