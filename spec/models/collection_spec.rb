require "rails_helper"
describe Collection do
  let(:manifest_url) { "http://example.org/1/manifest" }
  subject { described_class.new(label: "Test Collection", manifest_url: manifest_url) }

  it "has properties" do
    expect(subject.manifest_url).to eq(manifest_url)
    expect(subject.label).to eq("Test Collection")
    expect(subject.html_url).to be_nil
  end
end
