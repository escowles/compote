require "rails_helper"
describe Manifest do
  let(:manifest_url) { "http://example.org/1/manifest" }
  let(:html_url) { "http://example.org/1/index.html" }
  subject { described_class.new(label: "Test Manifest", manifest_url: manifest_url, html_url: html_url) }

  it "has properties" do
    expect(subject.manifest_url).to eq(manifest_url)
    expect(subject.label).to eq("Test Manifest")
    expect(subject.html_url).to eq(html_url)
  end
end
